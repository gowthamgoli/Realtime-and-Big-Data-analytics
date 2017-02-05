import collections

f = open('analytics_311_rodents', "r")
lines = f.readlines()
analytics = {}
sum = 0
for line in lines:
	tokens = line.split()
	if len(tokens) == 3:
		date = tokens[0]
		borough = tokens[1]
		numComplaints = tokens[2]
		[month, year] = date.split('/')
	elif len(tokens) == 4:
		date = tokens[0]
		borough = tokens[1] + " " + tokens[2]
		numComplaints = tokens[3]
		[month, year] = date.split('/')

	if borough not in analytics.keys():
		analytics[borough] = {year:{month:numComplaints}}
	else:
		if year not in analytics[borough].keys():
			analytics[borough][year] = {month:numComplaints}
		else:
			if month not in analytics[borough][year].keys():
				analytics[borough][year][month] = numComplaints

'''for borough, val1 in analytics.iteritems():
	print borough 
	print '-'*100
	for year, val2 in val1.iteritems():
		print year
		print '-'*50
		for month, n in val2.iteritems():
			print month, n
			sum = sum + int(n)
		print '''''

for borough in sorted(analytics):
	print borough
	print '-'*100
	for year in sorted(analytics[borough]):
		print year
		print '-'*50
		for month in sorted(analytics[borough][year]):
			print analytics[borough][year][month]
		print ''

#print 'total complaints: ', sum



import json 
import sys 

with open(sys.argv[1], "r") as read_file:
    data = json.load(read_file)

# print(data['results'])
for i in data['results'] : 
    if str(i['status']) == str(sys.argv[2]):
        if str(i['status']) == '301' or str(i['status']) == '302':
            print(i['url']) 
            print("Redirect location : ",i['redirectlocation'])
            print('---')
        else:
            print(i['url'])	

		

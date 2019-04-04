# author : Chintan Solanki
# Input file directory

import numpy as np
import pandas as pd
Filename=raw_input('Enter the CSV file name without .CSV\n')

#create the uniquer names
df1= pd.read_csv(Filename+'.csv')
list1=df1[[list(df1)[0]]].drop_duplicates(subset=[list(df1)[0]], keep='first').reset_index()

#create directory name lis1
lis1={}
for i in range(len(list1)):
    name=list1[list(df1)[0]][i]
    lis1[name]= df1[list(df1)[1]].loc[df1[list(df1)[0]] == name ].values.astype('str').tolist()   

#directory to dataFrame
df5=pd.DataFrame(list1)
df5['first']=1
for key,value in lis1.items():
    i=list(df5[list(df1)[0]]).index(str(key))
    df5.loc[i,'first']=','.join(value)
   
#split it
final=pd.DataFrame(df5['first'].str.split(',').tolist())
final[list(df1)[0]]=df5[list(df1)[0]]
final=final.set_index(list(df1)[0])

print(final)
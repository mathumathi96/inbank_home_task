import pandas as pd
import sys,os
from datetime import date

today = date.today()
cwd=os.path.abspath(".")
print(cwd)

file1=cwd+'/'+sys.argv[1]
file2=cwd+'/'+sys.argv[2]

data1 = pd.read_csv(file1,sep=';')
data2 = pd.read_csv(file2,sep=';')
combined_data = pd.concat([data1,data2],axis=0)
combined_data['combined_metric_date']=today


combined_data.to_csv(f"{cwd}/data_{today}.csv",index=False,sep=';')
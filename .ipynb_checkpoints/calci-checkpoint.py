# import pandas as pd
# from datetime import datetime
# import numpy as np

def calculator(months,amount,curr_month=None):
    if not curr_month: curr_month = datetime.today().month
    if len(months)>1:
        div_fact = min([month for month in months if month>curr_month])-curr_month+1
    else:
        months = months[0]
        m_diff = months-curr_month
        div_fact = np.where(months>curr_month,m_diff+1,13+m_diff)
    monthly_ex = round(amount/div_fact)

    return monthly_ex

# df = pd.read_csv('df.csv')

# def res():
#     total = []
#     for index,row in df.iterrows():
#         total = total + [calculator(row['Months'],row['Amount'])]
#     return sum(total)


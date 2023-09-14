#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pandas as pd

# Load your NFB data into a Pandas DataFrame (replace 'nfb_data.csv' with your actual file)
nfb_data = pd.read_csv(r"C:\Users\Idea Tech\OneDrive\Desktop\New folder\NF1_Ses2_NF_details_fatimaeo.csv")

# Define the value to count (e.g., 1 for active state)
target_value = 1

# Initialize variables to count intervals and track state
interval_count = 0
in_target_state = False

# Iterate through the NFB data
for index, row in nfb_data.iterrows():
    value = row['NFB_Score']  
    
    if value == target_value:
        # If the value is the target value and we're not already in the target state, it's the start of a new interval
        if not in_target_state:
            in_target_state = True
            interval_count += 1
    else:
        # If the value is not the target value and we were in the target state, it's the end of an interval
        if in_target_state:
            in_target_state = False

# Print the number of intervals where the target value appears
print(f'Fractional Occupancy {target_value}: {interval_count}')


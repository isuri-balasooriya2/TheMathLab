import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

'''
   --------Data Loading and Exploring------------
'''
df = pd.read_csv("scrubbed.csv")
#print(df.head())
#print(df.info())
#print(df.describe())

'''
   --------Data Cleaning--------------
'''
df = df.drop(columns=['duration (hours/min)'], errors='ignore')
df = df.drop(columns=['date posted'], errors='ignore')

df = df.dropna(subset=['comments', 'shape'])

df['state'].fillna('N/A', inplace=True)
df['country'].fillna('Unknown', inplace=True)

df['latitude'] = pd.to_numeric(df['latitude'], errors='coerce')

'''
  ----------Data Analysis-----------------
'''
# Convert to datetime format
df['datetime'] = pd.to_datetime(df['datetime'], errors='coerce')
df['year'] = df['datetime'].dt.year

# Count sightings per year
sightings_per_year = df['year'].value_counts().sort_index()

# Plot
plt.figure(figsize=(10,5))
plt.plot(sightings_per_year.index, sightings_per_year.values, marker='o', linestyle='-')
plt.xlabel("Year")
plt.ylabel("Number of Sightings")
plt.title("UFO Sightings Over the Years")
plt.grid()
plt.show()

# Count UFO shapes
shape_counts = df['shape'].value_counts()[:10]

# Plot
plt.figure(figsize=(10,5))
sns.barplot(x=shape_counts.index, y=shape_counts.values, palette='coolwarm')
plt.xlabel("UFO Shape")
plt.ylabel("Count")
plt.title("Most Reported UFO Shapes")
plt.xticks(rotation=45)
plt.show()

# Count sightings per country
country_counts = df['country'].value_counts()[:10]

# Plot
plt.figure(figsize=(10,5))
sns.barplot(x=country_counts.index, y=country_counts.values, palette='viridis')
plt.xlabel("Country")
plt.ylabel("Number of Sightings")
plt.title("Top 10 Country with Most UFO Sightings")
plt.show()

# Extract hour from datetime
df['hour'] = df['datetime'].dt.hour

# Plot
plt.figure(figsize=(10,5))
sns.histplot(df['hour'], bins=24, kde=True, color='blue')
plt.xlabel("Hour of the Day")
plt.ylabel("Number of Sightings")
plt.title("UFO Sightings by Hour")
plt.xticks(range(0,24))
plt.show()

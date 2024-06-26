# cueloc

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


from typing import List
import math
Vector=List[float]

height_weight_age=[70,170,40]
grades=[95,80,75,62]

def add(v:Vector,w:Vector):
    assert len(v) == len(w) , "vectors must be of same length"
    return [v_i + w_i for v_i,w_i in zip(v,w)]

def subtract(v:Vector,w:Vector):
    assert len(v) == len(w) , "vectors must be of same length"
    return [v_i - w_i for v_i,w_i in zip(v,w)]

def vector_sum(vectors:List[Vector])->Vector:
    """Sums all corresponding elements"""
    assert vectors,"no vectors provided!"
    num_elements=len(vectors[0])
    assert all(len(v) == num_elements for v in vectors),"different sizes!"
    return [sum(vector[i] for vector in vectors) for i in range(num_elements)]

def scalar_multiply(c:float,v:Vector)->Vector:
    """Multiplies every element by c"""
    return [c*v_i for v_i in v]

def vector_mean(vectors:List[Vector])->Vector:
    """Computes element wise average"""
    n=len(vectors)
    return scalar_multiply(1/n,vector_sum(vectors))

def dot(v:Vector,w:Vector)->float:
    assert len(v) == len(w) , "vectors must be the same length"
    return sum(v_i*w_i for v_i,w_i in zip(v,w))

def sum_of_squares(v:Vector)->float:
    return dot(v,v)
 
def magnitude(v:Vector)->float:
    return math.sqrt(sum_of_squares(v))

def squarred_distance(v:Vector,w:Vector)->float:
    return sum_of_squares(subtract(v,w))


def distance(v:Vector,w:Vector)->float:
    return math.sqrt(squarred_distance(v,w))
if __name__ == "__main__":
 
    print("1.Add Vectors:",add([1,2,3],[4,5,6]))
    print("2.Subtract Vectors",subtract([5,7,9],[4,5,6]))
    print("3. Vector Sum",vector_sum([[1,2],[3,4],[5,6],[7,8]]))
    print("4. Scalar Multiply",scalar_multiply(2,[1,2,3]))
    print("5. Vector Mean:",vector_mean([[1,2],[3,4],[5,6]]))
    print("6. Dot Product;",dot([1,2,3],[4,5,6]))
    print("7 Sum of Squares:",sum_of_squares([1,2,3]))
    print("8. Magnitude:",magnitude([3,4]))
    print("9.Distance:",distance([1,2,3],[4,5,6]))








Program 2

from typing import List
from collections import Counter


import matplotlib.pyplot as plt


import math


num_friends = [100, 49, 41, 40, 25]  
daily_minutes = []   # Your data here
daily_hours = []  	  # Your data here



friend_counts = Counter(num_friends)
xs = range(101)                         
ys = [friend_counts[x] for x in xs]     
plt.bar(xs, ys)
plt.axis([0, 101, 0, 25])
plt.title("Histogram of Friend Counts")
plt.xlabel("# of friends")
plt.ylabel("# of people")
plt.show()



num_points = len(num_friends)               


largest_value = max(num_friends)            


smallest_value = min(num_friends)           



sorted_values = sorted(num_friends)

smallest_value = sorted_values[0]           

second_smallest_value = sorted_values[1]    # 1
second_largest_value = sorted_values[-2]    # 49


def mean(xs: List[float]) -> float:

    return sum(xs) / len(xs)

print("Mean:", mean(num_friends))   

def _median_odd(xs: List[float]) -> float:
    """If len(xs) is odd, the median is the middle element"""
    return sorted(xs)[len(xs) // 2]



def _median_even(xs: List[float]) -> float:
    """If len(xs) is even, it's the average of the middle two elements"""
    sorted_xs = sorted(xs)
    hi_midpoint = len(xs) // 2  			# e.g. length 4 => hi_midpoint 2
    return (sorted_xs[hi_midpoint - 1] + sorted_xs[hi_midpoint]) / 2


def median(v: List[float]) -> float:
    """Finds the 'middle-most' value of v"""
    return _median_even(v) if len(v) % 2 == 0 else _median_odd(v)

print("Median:", median(num_friends))  # 6


def quantile(xs: List[float], p: float) -> float:
    """Returns the pth-percentile value in x"""
    p_index = int(p * len(xs))
    return sorted(xs)[p_index]

print("Quantile (10th percentile):", quantile(num_friends, 0.10))
print("Quantile (25th percentile):", quantile(num_friends, 0.25))
print("Quantile (75th percentile):", quantile(num_friends, 0.75))
print("Quantile (90th percentile):", quantile(num_friends, 0.90))


def mode(x: List[float]) -> List[float]:
    """Returns a list, since there might be more than one mode"""
    counts = Counter(x)
    max_count = max(counts.values())
    return [x_i for x_i, count in counts.items() if count == max_count]
print("Mode:", mode(num_friends))


def data_range(xs: List[float]) -> float:
    return max(xs) - min(xs)
print("Data Range:", data_range(num_friends))


def de_mean(xs: List[float]) -> List[float]:
    """Translate xs by subtracting its mean (so the result has mean 0)"""
    x_bar = mean(xs)
    return [x - x_bar for x in xs]

def sum_of_squares(xs: List[float]) -> float:
    """Returns the sum of squares of elements in xs"""
    return sum(x * x for x in xs)

def variance(xs: List[float]) -> float:
    """Returns the variance of xs"""
    assert len(xs) >= 2, "variance requires at least two elements"
    n = len(xs)
    deviations = de_mean(xs)
    return sum_of_squares(deviations) / (n - 1)
print("Variance:", variance(num_friends))


def standard_deviation(xs: List[float]) -> float:
    """Returns the standard deviation of xs"""
    return math.sqrt(variance(xs))
print("Standard Deviation:", standard_deviation(num_friends))


def interquartile_range(xs: List[float]) -> float:
    """Returns the interquartile range of xs"""
    return quantile(xs, 0.75) - quantile(xs, 0.25)
print("Interquartile Range:", interquartile_range(num_friends))








Program 3
import matplotlib.pyplot as plt
hours_studied=[10,9,2,15,10,16,11,16]
exam_scores=[95,80,10,50,45,98,38,93]
plt.plot(hours_studied,exam_scores,marker = '*' , color = 'red')
plt.xlabel('Number of hours studied')
plt.ylabel('Score in final exam')
plt.title('Effect of hours studied on Exam Performance')
plt.grid(True)
plt.show()




Program 4
import pandas as pd
import matplotlib.pyplot as plt
df=pd.read_csv('mtcars.csv')
plt.hist(df['mpg'] , bins=10 , color= 'skyblue', edgecolor='black')
plt.xlabel('Miles per gallon(mpg)')
plt.ylabel('Frequency')
plt.title('Histogram of miles per Gallon/mpg')
plt.show()


Program 5
import numpy  as np
import pandas as pd
import re
df=pd.read_csv('BL-Flickr-Images-Book.csv')
irrelevant_columns=['Edition Statement','Corporate Author','Corporate Contributors','Former owner','Engraver','Contributors','Issuance type','Shelfmarks']
df.drop(columns=irrelevant_columns,inplace=True)
df.set_index('Identifier',inplace=True)
df['Date of Publication']=df['Date of Publication'].str.extract(r'^(\d{4})',expand=False)
df['Date of Publication']=pd.to_numeric(df['Date of Publication'],errors='coerce')
print(df.head())




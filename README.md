# Code used for analysis:
This repository contains a Python script designed for the spatial analysis of single-cell data based on their X and Y spatial coordinates, including quadrant analysis, density plotting, and advanced statistical analysis such as the nearest-neighbor radius and cross-G-Function analysis.

## Table of Contents
. Required Libraries
. Data Importation or Generation
. Geographic Cells Distribution
. Spatial Distribution at the Single-Cell Level
. Creation of Distance Matrices
. Scatter Plot and Connectivity Dot Plot
. Nearest-Neighbor Radius Analysis
. Cross-G-Function Analysis

## Required Libraries
The following Python libraries are required to run the script:
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import glob
import os
import seaborn as sns
from tifffile import imread
#import scanpy as sc
#import umap
from sklearn.manifold import TSNE
from sklearn.cluster import KMeans
#import leidenalg
from mpl_toolkits.mplot3d import axes3d
from scipy import stats
from scipy.spatial import distance
from scipy.interpolate import griddata
from pointpats import ripley
from sklearn.preprocessing import MinMaxScaler, StandardScaler
from sklearn.cluster import DBSCAN
from scipy.spatial import distance
from scipy.stats import poisson
from scipy.stats import norm
#from .geometry import TREE_TYPES
#%matplotlib notebook

import pandas as pd
import numpy as np
from sklearn.preprocessing import MinMaxScaler, StandardScaler
from sklearn.cluster import KMeans

from scipy.interpolate import griddata
from scipy.stats import norm

from scipy.stats import poisson


## Data Importation or Generation
You can either import your own data from an Excel file or generate a dummy dataset directly within the script for testing purposes.

###  Option 1: Importing Data
The script starts by importing an Excel file containing the single-cell data and the X and Y spatial coordinates of each cell. The data file should include columns for X and Y coordinates of cells, and additional columns for cell population labels.
Ensure that the Excel file is properly formatted (one column with X-coordinate, one column with Y-coordinate and one column called "KM_label" to identify and label your different cell populaiton) and located in the correct director.

### Option 2: Generating Dummy Data
Alternatively, you can generate a dummy dataset directly in the script. This dataset contains 100 cells with randomly generated X and Y coordinates, and a KM_label column indicating the cell population (1 or 2).

import numpy as np
import pandas as pd

#### Set the seed for reproducibility
np.random.seed(42)

#### Create a dummy dataset
num_cells = 100
X_coordinates = np.random.uniform(0, 100, num_cells)
Y_coordinates = np.random.uniform(0, 100, num_cells)
KM_labels = np.random.choice([1, 2], num_cells)

#### Combine into a DataFrame
data = pd.DataFrame({
    'X': X_coordinates,
    'Y': Y_coordinates,
    'KM_label': KM_labels
})

#### Display the first few rows of the dataset
print(data.head())

## Geographic Cells Distribution
The script generates dot plots representing the geographic distribution of cells based on their X and Y coordinates. Each cell is plotted on a 2D grid, visualizing the spatial arrangement of the cells.

## Spatial Distribution at the Single-Cell Level
This section includes:

*Quadrant Analysis:* The cells are divided into quadrants based on their X/Y coordinates. The number and density of cells within each quadrant are calculated and displayed.

*Density Plot:* A density plot is generated using a color gradient to visualize where cells are most concentrated.

## Creation of Distance Matrices
Distance matrices are created containing the X and Y coordinates of the cells along with a label (KM_label) indicating the specific cell population. This is essential for analyzing the spatial relationships between different cell populations.

## Scatter Plot and Connectivity Dot Plot
Scatter plots are created for the cells of interest. Additionally, a connectivity dot plot is generated that connects the most central cell of one population to all other cells of a second population. The script also calculates the minimum and mean Euclidean distances from each cell in population 1 to all cells in population 2.

## Nearest-Neighbor Radius Analysis
A histogram plot of all previously calculated minimum or mean Euclidean distances is generated, overlaid with a Poisson distribution curve. The mean of the minimum Euclidean distances and the standard deviation are displayed.

## Cross-G-Function Analysis
The cross-G-Function is calculated and plotted against the theoretical expectation or Poisson curve separately for cell populations 1 and 2. A shaded grey area is added between the two curves, and the area above, below the curve, and the total area are calculated and displayed.

## How to Run
. Ensure all required libraries are installed.
. Choose to either import your data or generate a dummy dataset.
. Run the script in your Python environment:

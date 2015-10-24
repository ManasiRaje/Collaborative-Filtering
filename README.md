# Collaborative-Filtering
Movie Recommendation System

Recommendation systems and "suggestions" have become an essential part of a lot of web applications. Examples of these applications include recommended items in online stores, pages or people in social networking sites, movies or songs in streaming websites, etc. What has enabled these systems to expand widely to so many different applications is the rapidly growing collective user data and the use of Collaborative Filtering. 

"Collaborative Filtering" refers to methods of predicting a user's opinion on an entity using other users' opinion. These methods are based on the notion that there exist other users with similar behavior as the target user and finding them and observing their actions will reveal information that we could use to predict the target user's behavior. 

We can view this as a matrix problem by putting all users on rows and all items on columns of the matrix. Then the entry of the matrix will be the rating user has given to item . The problem will now become estimating the empty entries of the matrix to predict what items a user will most probably like other than the ones they have rated.

In this project we are going to use a popular method for collaborative filtering called "Alternating Least Squares" to make a recommendation system on the MovieLens dataset (http://grouplens.org/datasets/movielens/) that contains movies and user ratings.


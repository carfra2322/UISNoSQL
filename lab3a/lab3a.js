//Create a new database named “blogger”
use blogger



// 1) Create 3 users with _id = "5bb26043708926e438db6cad",
// "5bb26043708926e438db6cae", "5bb26043708926e438db6caf"
// users collection contains fields name and email.
// For the field _id, use ObjectId instead of String.
// Ex:  "_id" : ObjectId("5bb26043708926e438db6cad")


function insertUser(
  id,
  name,
  email
) {
  db.users.insert({
    _id: ObjectId(id),
      name: name,
      email:email
  });
}

insertUser("5bb26043708926e438db6cad", "emma", "emma@gmail.com")
insertUser("5bb26043708926e438db6cae", "kate", "kate@gmail.com")
insertUser("5bb26043708926e438db6caf", "enji", "enji@gmail.com")


// a) List the contents of the users collection in pretty form


db.users.find().pretty()


// b) Search for user 5bb26043708926e438db6cad


db.users.find({"_id":ObjectId("5bb26043708926e438db6cad")})



// Create 3 blogs with fields: title, body, slug, author,
// comments: (array with objects containing user_id, comment, approved, created_at),
// category (array with objects containing name)
// The user_id and author fields should be one of the 3 users _id found above
// One of the posts should contain the word "framework" in the body

function createBlog(
  title,
  body,
  slug,
  author,
  comments,
  category
) {
  db.blogs.insert({
      title: title,
      body: body,
      slug: slug,
      author: ObjectId(author),
      comments: comments,
      category: category
  });
}

createBlog(
    "Machine Learning for babies",
    "ML is very fun for babies",
    "Machine-Learning-for-babies",
    "5bb26043708926e438db6cad",
    [
        {
            user_id:ObjectId("5bb26043708926e438db6cae"),
            comment: "I agree ML is fun for babies",
            approved: true,
            created_at: ISODate("2020-02-02"),
        },
        {
            user_id:ObjectId("5bb26043708926e438db6caf"),
            comment: "Had so much fun reading this",
            approved: true,
            created_at: ISODate("2020-02-02"),
        },
        ],
    [
        {name: "Data Science"},
        {name: "Technology"}
        ]
)


createBlog(
    "Big Data for babies",
    "Big Data is very fun for babies",
    "Big-Data-for-babies",
    "5bb26043708926e438db6cad",
    [
        {
            user_id:ObjectId("5bb26043708926e438db6cae"),
            comment: "I agree Big Data is fun for babies",
            approved: true,
            created_at: ISODate("2020-02-02"),
        },
        {
            user_id:ObjectId("5bb26043708926e438db6caf"),
            comment: "Had so much fun reading this",
            approved: true,
            created_at: ISODate("2020-02-02"),
        },
        ],
    [
        {name: "Data Science"},
        {name: "Technology"}
        ]
)

createBlog(
    "NoSQL using GraphQL framework",
    "GraphQL is a good framework for NoSQL interaction",
    "NoSQL-using-GraphQL-framework",
    "5bb26043708926e438db6caf",
    [
        {
            user_id:ObjectId("5bb26043708926e438db6cad"),
            comment: "Very cool blog",
            approved: true,
            created_at: ISODate("2020-02-02"),
        },
        {
            user_id:ObjectId("5bb26043708926e438db6cae"),
            comment: "Loved it",
            approved: true,
            created_at: ISODate("2020-02-02"),
        },
        ],
    [
        {name: "Data Science"},
        {name: "Technology"}
        ]
)

// All comments by User 5bb26043708926e438db6caf across all posts displaying
// only the title and slug


db.blogs.find(
    {'comments':{ $elemMatch:{'user_id':ObjectId('5bb26043708926e438db6caf')}}},
    {_id:0, title:1, slug:1, "comments.comment.$":1}
).pretty()

// Select a blog via a case-insensitive regular expression containing the word
// Framework in the body displaying only the title and body
db.blogs.find({body: /framework/i}, {_id:0, title:1, body:1}).pretty()

puts "Running DB seed..."

# Don't let seed duplicate data more than once
puts "Cleaning database..."
User.destroy_all
puts "Creating sample Users..."
User.create([
    {
      fname: "Neeson",
      lname: "Grant",
      username: "ngrant",
      email: "new@email.com",
      password_digest: "$2a$12$n/CEaft4d0qmEUgxnNAPFurBBgw4PI9eVrv/rUewwlTFPn7NY/Yuq",
      created_at: "2018-04-14 02:09:44.528632",
      updated_at: "2018-04-19 16:22:55.254084"
    },
    {
      fname: "Salma",
      lname: "Tine",
      username: "stine",
      email: "salma@hotmail.com",
      password_digest: "$2a$12$n/CEaft4d0qmEUgxnNAPFurBBgw4PI9eVrv/rUewwlTFPn7NY/Yuq",
      created_at: "2018-04-14 02:17:30.310658",
      updated_at: "2018-04-14 02:17:30.310658"
    },
    {
      fname: "Rend",
      lname: "Miller",
      username: "rmiller",
      email: "hend@anything.com",
      password_digest: "$2a$12$n/CEaft4d0qmEUgxnNAPFurBBgw4PI9eVrv/rUewwlTFPn7NY/Yuq",
      created_at: "2018-04-16 23:44:09.971071",
      updated_at: "2018-04-16 23:44:09.971071"
    },
    {
      fname: "Eddie",
      lname: "Opara",
      username: "eopara",
      email: "eopara@gmail.com",
      password_digest: "$2a$12$n/CEaft4d0qmEUgxnNAPFurBBgw4PI9eVrv/rUewwlTFPn7NY/Yuq",
      created_at: "2021-02-22 18:42:08.345412",
      updated_at: "2021-02-22 18:42:08.345412"
    }
            ])
puts "Users Completed..."
puts "Adding Listings ..."

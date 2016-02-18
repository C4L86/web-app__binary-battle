require_relative "./_configure"

DB.define_table("movies")
DB.define_column("movies", "title", "string")

DB.define_table("votes")
DB.define_column("votes", "upvote_id", "integer")
DB.define_column("votes", "downvote_id", "integer")
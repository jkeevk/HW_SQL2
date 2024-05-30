CREATE TABLE IF NOT EXISTS genre (
	genre_id SERIAL UNIQUE NOT NULL PRIMARY KEY,
	title VARCHAR(30) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS musiciant (
	musiciant_id SERIAL UNIQUE NOT NULL PRIMARY KEY,
	name VARCHAR(30) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS album (
	album_id SERIAL UNIQUE NOT NULL PRIMARY KEY,
	title VARCHAR(30) NOT NULL,
	release_year DATE NOT NULL
);


CREATE TABLE IF NOT EXISTS track (
	track_id SERIAL UNIQUE NOT NULL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES album(album_id),
	title VARCHAR(30) NOT NULL,
	duration TIME NOT NULL
);

CREATE TABLE IF NOT EXISTS musiciants_to_genres (
	genre_id INTEGER REFERENCES genre(genre_id),
	musiciant_id INTEGER REFERENCES musiciant(musiciant_id),
	CONSTRAINT g_m PRIMARY KEY (genre_id, musiciant_id)
);



CREATE TABLE IF NOT EXISTS musiciants_to_albums (
	album_id INTEGER REFERENCES album(album_id),
	musiciant_id INTEGER REFERENCES musiciant(musiciant_id),
	CONSTRAINT a_m PRIMARY KEY (album_id, musiciant_id)
);

CREATE TABLE IF NOT EXISTS collection (
	collection_id SERIAL UNIQUE NOT NULL PRIMARY KEY,
	title VARCHAR(30) NOT NULL,
	release_year DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS collection_to_track (
	track_id INTEGER REFERENCES track(track_id),
	collection_id INTEGER REFERENCES collection(collection_id),
	CONSTRAINT t_c PRIMARY KEY (track_id, collection_id)
);










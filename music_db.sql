CREATE TABLE artist (
    artist_id   SERIAL      PRIMARY KEY,
    title       VARCHAR(30) NOT NULL
);

CREATE TABLE album (
    album_id     SERIAL      PRIMARY KEY,
    title        VARCHAR(40) NOT NULL,
    release_year INTEGER     NOT NULL CHECK(release_year > 1900)
);

CREATE TABLE artist_album (
    artist_id INTEGER REFERENCES artist(artist_id),
    album_id  INTEGER REFERENCES album(album_id),
                      CONSTRAINT artist_album_pk PRIMARY KEY(artist_id, album_id)
);

CREATE TABLE genre (
    genre_id SERIAL      PRIMARY KEY,
    title    VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE artist_genre (
    artist_id INTEGER REFERENCES artist(artist_id),
    genre_id  INTEGER REFERENCES genre(genre_id),
                      CONSTRAINT artist_genre_pk PRIMARY KEY(artist_id, genre_id)
);

CREATE TABLE track (
    track_id     SERIAL      PRIMARY KEY,
    title        VARCHAR(40) NOT NULL,
    duration     INTEGER     NOT NULL,
    album_id     INTEGER     REFERENCES album(album_id)
);

CREATE TABLE mixtape (
    mixtape_id   SERIAL      PRIMARY KEY,
    title        VARCHAR(40) NOT NULL,
    release_year INTEGER     NOT NULL
);

CREATE TABLE track_mixtape (
    track_id   INTEGER REFERENCES track(track_id),
    mixtape_id INTEGER REFERENCES mixtape(mixtape_id),
                       CONSTRAINT track_mixtape_pk PRIMARY KEY(track_id, mixtape_id)
);

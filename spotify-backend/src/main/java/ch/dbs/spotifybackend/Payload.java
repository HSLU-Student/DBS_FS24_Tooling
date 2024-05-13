package ch.dbs.spotifybackend;

public record Payload(boolean collaberative, String description, ExternalUrls externalUrls, Followers followers) {}
package ch.dbs.spotifybackend;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;

@Entity
@Table(name= "artist")
public class ArtistEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Size(max = 450)
    @Column(name = "name", length = 450)
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}

package ch.dbs.spotifybackend;

import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Validated
@RequestMapping("/backend")
public class SpotifyController {
    private final DataService dataService;

    public SpotifyController(final DataService dataService) {
        this.dataService = dataService;
    }

    @GetMapping("/releases")
    public ResponseEntity<String> getReleases(@RequestBody Payload payload){
        return ResponseEntity.ok("OK");
    }

}

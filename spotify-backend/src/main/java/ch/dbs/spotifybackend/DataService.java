package ch.dbs.spotifybackend;

import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

@Service
public class DataService {
    private final ArtistRepository artistRepository;

    public DataService(final ArtistRepository artistRepository) {
        this.artistRepository = artistRepository;
    }

    @Transactional
    public void test(int a) {
        artistRepository.findById(1);
        // find in db xy
        // postprocessing
    }
}

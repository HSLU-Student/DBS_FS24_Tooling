-- Export der Format Daten für MongoDB
USE dtos;
SELECT rhf.release_id, f.format FROM format f
JOIN release_has_format rhf ON f.format_id = rhf.format_id
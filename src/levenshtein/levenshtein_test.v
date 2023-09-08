module levenshtein

fn test_levenshtein(){
	assert levenshtein.distance("kitten", "sitting") == 3
	assert levenshtein.distance("saturday", "sunday") == 3
	assert levenshtein.distance("sittin", "sitting") == 1
}
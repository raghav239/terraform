
resource "google_tags_tag_key" "test-key" {
  parent = "projects/791210556975"
  short_name = "test-key"
}

resource "google_tags_tag_value" "test-value1" {
  parent = "tagKeys/${google_tags_tag_key.test-key.name}"
  short_name = "test-value1"
}

/*
resource "google_tags_tag_key" "tag-key" {
  parent = "projects/791210556975"
  short_name = "test-tag1"   
}


resource "google_tags_tag_value" "tag-value" {
  parent = "tagKeys/${google_tags_tag_key.tag-key.name}"
  short_name = "tag-value1"  
}

*/

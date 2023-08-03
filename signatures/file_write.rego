package tracker.TRC_1001
import data.tracker.helpers

__rego_metadoc__ := {
	"id": "TRC_1001",
	"version": "0.1.0",
	"name": "file_write",
	"eventName": "file_write",
	"description": "A file is being written to",
}

tracker_selected_events[eventSelector] {
	eventSelector := {
		"source": "tracker",
		"name": "security_file_open",
	}
}

tracker_match = res {
	input.eventName == "security_file_open"
	helpers.is_file_write(helpers.get_tracker_argument("flags"))
	pathname := helpers.get_tracker_argument("pathname")
  res := {
    "pathname": pathname,
  }
}

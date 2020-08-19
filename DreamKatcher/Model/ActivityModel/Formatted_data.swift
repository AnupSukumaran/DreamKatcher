/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Formatted_data : Codable {
	let url : String?
	let image : String?
	let title : String?
	let video : String?
	let isStream : Bool?
	let playback : Playback?
	let data_type : String?
	let contest_id : String?
	let user_media_type : String?
	let is_adult_content : Bool?
	let brief_description : String?
	let contest_file_type : String?
	let complete_description : String?
	let image_large_thumbnail : String?
	let image_small_thumbnail : String?

	enum CodingKeys: String, CodingKey {

		case url = "url"
		case image = "image"
		case title = "title"
		case video = "video"
		case isStream = "isStream"
		case playback = "playback"
		case data_type = "data_type"
		case contest_id = "contest_id"
		case user_media_type = "user_media_type"
		case is_adult_content = "is_adult_content"
		case brief_description = "brief_description"
		case contest_file_type = "contest_file_type"
		case complete_description = "complete_description"
		case image_large_thumbnail = "image_large_thumbnail"
		case image_small_thumbnail = "image_small_thumbnail"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		video = try values.decodeIfPresent(String.self, forKey: .video)
		isStream = try values.decodeIfPresent(Bool.self, forKey: .isStream)
		playback = try values.decodeIfPresent(Playback.self, forKey: .playback)
		data_type = try values.decodeIfPresent(String.self, forKey: .data_type)
		contest_id = try values.decodeIfPresent(String.self, forKey: .contest_id)
		user_media_type = try values.decodeIfPresent(String.self, forKey: .user_media_type)
		is_adult_content = try values.decodeIfPresent(Bool.self, forKey: .is_adult_content)
		brief_description = try values.decodeIfPresent(String.self, forKey: .brief_description)
		contest_file_type = try values.decodeIfPresent(String.self, forKey: .contest_file_type)
		complete_description = try values.decodeIfPresent(String.self, forKey: .complete_description)
		image_large_thumbnail = try values.decodeIfPresent(String.self, forKey: .image_large_thumbnail)
		image_small_thumbnail = try values.decodeIfPresent(String.self, forKey: .image_small_thumbnail)
	}

}
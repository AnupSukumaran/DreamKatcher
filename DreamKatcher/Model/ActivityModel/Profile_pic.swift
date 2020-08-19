/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Profile_pic : Codable {
	let id : Int?
	let content_type_id : Int?
	let created : String?
	let modified : String?
	let hidden : Bool?
	let blacklist : Bool?
	let admin_notes : String?
	let title : String?
	let is_adult_content : Bool?
	let image : String?
	let image_small_thumbnail : String?
	let image_large_thumbnail : String?
	let is_profile_pic : Bool?
	let is_cover_pic : Bool?
	let user : Int?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case content_type_id = "content_type_id"
		case created = "created"
		case modified = "modified"
		case hidden = "hidden"
		case blacklist = "blacklist"
		case admin_notes = "admin_notes"
		case title = "title"
		case is_adult_content = "is_adult_content"
		case image = "image"
		case image_small_thumbnail = "image_small_thumbnail"
		case image_large_thumbnail = "image_large_thumbnail"
		case is_profile_pic = "is_profile_pic"
		case is_cover_pic = "is_cover_pic"
		case user = "user"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		content_type_id = try values.decodeIfPresent(Int.self, forKey: .content_type_id)
		created = try values.decodeIfPresent(String.self, forKey: .created)
		modified = try values.decodeIfPresent(String.self, forKey: .modified)
		hidden = try values.decodeIfPresent(Bool.self, forKey: .hidden)
		blacklist = try values.decodeIfPresent(Bool.self, forKey: .blacklist)
		admin_notes = try values.decodeIfPresent(String.self, forKey: .admin_notes)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		is_adult_content = try values.decodeIfPresent(Bool.self, forKey: .is_adult_content)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		image_small_thumbnail = try values.decodeIfPresent(String.self, forKey: .image_small_thumbnail)
		image_large_thumbnail = try values.decodeIfPresent(String.self, forKey: .image_large_thumbnail)
		is_profile_pic = try values.decodeIfPresent(Bool.self, forKey: .is_profile_pic)
		is_cover_pic = try values.decodeIfPresent(Bool.self, forKey: .is_cover_pic)
		user = try values.decodeIfPresent(Int.self, forKey: .user)
	}

}
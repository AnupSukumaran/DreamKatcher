/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ResultsData : Codable {
	let status : String?
	let activity_id : Int?
	let created : String?
	let modified : String?
	let content_type_id : Int?
	let id : Int?
	let user : User?
	let message : String?
	let formatted_data : Formatted_data?
	let new_formatted_data : New_formatted_data?
	let data_type : String?
	let shareable_url : String?
	let reported_by_me : Bool?
	let comments_count : Int?
	let height : Double?
	let width : Double?
	let likes_count : Int?
	let hashtags : [String]?
	let liked_by_me : Bool?
	let is_following : Bool?
	let trending_point : Int?
	let my_clap : String?
	let total_claps : Int?

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case activity_id = "activity_id"
		case created = "created"
		case modified = "modified"
		case content_type_id = "content_type_id"
		case id = "id"
		case user = "user"
		case message = "message"
		case formatted_data = "formatted_data"
		case new_formatted_data = "new_formatted_data"
		case data_type = "data_type"
		case shareable_url = "shareable_url"
		case reported_by_me = "reported_by_me"
		case comments_count = "comments_count"
		case height = "height"
		case width = "width"
		case likes_count = "likes_count"
		case hashtags = "hashtags"
		case liked_by_me = "liked_by_me"
		case is_following = "is_following"
		case trending_point = "trending_point"
		case my_clap = "my_clap"
		case total_claps = "total_claps"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		activity_id = try values.decodeIfPresent(Int.self, forKey: .activity_id)
		created = try values.decodeIfPresent(String.self, forKey: .created)
		modified = try values.decodeIfPresent(String.self, forKey: .modified)
		content_type_id = try values.decodeIfPresent(Int.self, forKey: .content_type_id)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		user = try values.decodeIfPresent(User.self, forKey: .user)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		formatted_data = try values.decodeIfPresent(Formatted_data.self, forKey: .formatted_data)
		new_formatted_data = try values.decodeIfPresent(New_formatted_data.self, forKey: .new_formatted_data)
		data_type = try values.decodeIfPresent(String.self, forKey: .data_type)
		shareable_url = try values.decodeIfPresent(String.self, forKey: .shareable_url)
		reported_by_me = try values.decodeIfPresent(Bool.self, forKey: .reported_by_me)
		comments_count = try values.decodeIfPresent(Int.self, forKey: .comments_count)
		height = try values.decodeIfPresent(Double.self, forKey: .height)
		width = try values.decodeIfPresent(Double.self, forKey: .width)
		likes_count = try values.decodeIfPresent(Int.self, forKey: .likes_count)
		hashtags = try values.decodeIfPresent([String].self, forKey: .hashtags)
		liked_by_me = try values.decodeIfPresent(Bool.self, forKey: .liked_by_me)
		is_following = try values.decodeIfPresent(Bool.self, forKey: .is_following)
		trending_point = try values.decodeIfPresent(Int.self, forKey: .trending_point)
		my_clap = try values.decodeIfPresent(String.self, forKey: .my_clap)
		total_claps = try values.decodeIfPresent(Int.self, forKey: .total_claps)
	}

}

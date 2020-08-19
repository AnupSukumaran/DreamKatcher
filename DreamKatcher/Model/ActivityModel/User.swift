/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct User : Codable {
	let username : String?
	let id : Int?
	let first_name : String?
	let last_name : String?
	let full_name : String?
	let nickname : String?
	let gender : Int?
	let account_verified : Bool?
	let profile_pic_url : String?
	let profile_pic : Profile_pic?
	let shareable_url : String?
	let profile_pic_url_small_thumbnail : String?
	let profile_pic_url_large_thumbnail : String?

	enum CodingKeys: String, CodingKey {

		case username = "username"
		case id = "id"
		case first_name = "first_name"
		case last_name = "last_name"
		case full_name = "full_name"
		case nickname = "nickname"
		case gender = "gender"
		case account_verified = "account_verified"
		case profile_pic_url = "profile_pic_url"
		case profile_pic = "profile_pic"
		case shareable_url = "shareable_url"
		case profile_pic_url_small_thumbnail = "profile_pic_url_small_thumbnail"
		case profile_pic_url_large_thumbnail = "profile_pic_url_large_thumbnail"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		username = try values.decodeIfPresent(String.self, forKey: .username)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
		last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
		full_name = try values.decodeIfPresent(String.self, forKey: .full_name)
		nickname = try values.decodeIfPresent(String.self, forKey: .nickname)
		gender = try values.decodeIfPresent(Int.self, forKey: .gender)
		account_verified = try values.decodeIfPresent(Bool.self, forKey: .account_verified)
		profile_pic_url = try values.decodeIfPresent(String.self, forKey: .profile_pic_url)
		profile_pic = try values.decodeIfPresent(Profile_pic.self, forKey: .profile_pic)
		shareable_url = try values.decodeIfPresent(String.self, forKey: .shareable_url)
		profile_pic_url_small_thumbnail = try values.decodeIfPresent(String.self, forKey: .profile_pic_url_small_thumbnail)
		profile_pic_url_large_thumbnail = try values.decodeIfPresent(String.self, forKey: .profile_pic_url_large_thumbnail)
	}

}
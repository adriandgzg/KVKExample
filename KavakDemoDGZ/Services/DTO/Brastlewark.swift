
import Foundation

struct Brastlewark : Codable {
	let id : Int?
	let name : String?
	let thumbnail : String?
	let age : Int?
	let weight : Double?
	let height : Double?
	let hair_color : String?
	let professions : [String]?
    let friends : [String]? 
    let gender : String?
	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case thumbnail = "thumbnail"
		case age = "age"
		case weight = "weight"
		case height = "height"
		case hair_color = "hair_color"
		case professions = "professions"
		case friends = "friends"
        
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
		age = try values.decodeIfPresent(Int.self, forKey: .age)
		weight = try values.decodeIfPresent(Double.self, forKey: .weight)
		height = try values.decodeIfPresent(Double.self, forKey: .height)
		hair_color = try values.decodeIfPresent(String.self, forKey: .hair_color)
		professions = try values.decodeIfPresent([String].self, forKey: .professions)
		friends = try values.decodeIfPresent([String].self, forKey: .friends)
        
        if hair_color == "Red"{
         gender = "Female"
        }else
        {
            gender  = "Male"
        }
	}

}

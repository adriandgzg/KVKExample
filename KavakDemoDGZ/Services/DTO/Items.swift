
import Foundation

struct Items : Codable {
	let brastlewark : [Brastlewark]?

	enum CodingKeys: String, CodingKey {

		case brastlewark = "Brastlewark"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		brastlewark = try values.decodeIfPresent([Brastlewark].self, forKey: .brastlewark)
	}

}

//
//  Character.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 11/1/23.
//

import Foundation


// MARK: - Character
struct Character: Codable
{
    let id: Int? //(int, optional): The unique ID of the character resource.,
    let name: String? //(string, optional): The name of the character.,
    let description: String? //(string, optional): A short bio or description of the character.,
    let modified: String? //(Date, optional): The date the resource was most recently modified.,
    let resourceURI: String? // (string, optional): The canonical URL identifier for this resource.,
    let urls: [Url]? // (Array[Url], optional): A set of public web site URLs for the resource.,
    let thumbnail: Image? // (Image, optional): The representative image for this character.,
    let comics: ComicList? // (ComicList, optional): A resource list containing comics which feature this character.,
    let stories: StoryList? // (StoryList, optional): A resource list of stories in which this character appears.,
    let events: EventList? // (EventList, optional): A resource list of events in which this character appears.,
    let series: SeriesList? //(SeriesList, optional): A resource list of series in which this character appears.

}

// MARK: Character convenience initializers and mutators
extension Character {
    init(data: Data) throws {
        self = try JSONDecoder().decode(
            Character.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(
                domain: "JSONDecoding",
                code: 0,
                userInfo: nil)
        }

        try self.init(data: data)
    }
    
    public func getLists() -> [Codable] {
        
        var lists:[Codable] = []
        
        if let comics = comics, comics.available ?? 0 > 0{
            lists.append(comics)
        }
        if let stories = stories, stories.available ?? 0 > 0{
            lists.append(stories)
        }
        if let events = events, events.available ?? 0 > 0{
            lists.append(events)
        }
        if let series = series, series.available ?? 0 > 0{
            lists.append(series)
        }
        
        return lists
        
    }
    
}


//
//  Gist.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 9.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
/*
{
    "id": "8f28fda67396a49a6c46b0964be4f5a8",
    "description": "Knowledge base",
    "comments": 0,
    "created_at": "2021-10-23T11:30:25Z",
    "url": "https://api.github.com/gists/8f28fda67396a49a6c46b0964be4f5a8",
    "node_id": "G_kwDOAS690toAIDhmMjhmZGE2NzM5NmE0OWE2YzQ2YjA5NjRiZTRmNWE4",
    "git_push_url": "https://gist.github.com/8f28fda67396a49a6c46b0964be4f5a8.git",
    "html_url": "https://gist.github.com/8f28fda67396a49a6c46b0964be4f5a8",
    "git_pull_url": "https://gist.github.com/8f28fda67396a49a6c46b0964be4f5a8.git",
    "updated_at": "2021-10-23T11:30:25Z",
    "truncated": false,
    "forks_url": "https://api.github.com/gists/8f28fda67396a49a6c46b0964be4f5a8/forks",
    "commits_url": "https://api.github.com/gists/8f28fda67396a49a6c46b0964be4f5a8/commits",
    "user": null,
    "public": true,
    "comments_url": "https://api.github.com/gists/8f28fda67396a49a6c46b0964be4f5a8/comments"
  }
*/

struct Gist: Decodable {
    var id: String?
    var url: String?
    var description: String?
    var createdAt: String?
    var nodeId: String?
    var comments: Int?
    
    var isFavorite: Bool = false
    
    private var owner: Owner?
    var avatarUrl: String? {
        return owner?.avatarUrl
    }
    
    struct Owner: Decodable {
        var avatarUrl: String?
        
        enum CodingKeys: String, CodingKey {
            case avatarUrl = "avatar_url"
        }
        
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case description
        case createdAt = "created_at"
        case comments
        case nodeId = "node_id"
        case owner
    }
}

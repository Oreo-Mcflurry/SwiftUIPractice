//
//  MovieSearch.swift
//  SwiftUIPractice
//
//  Created by A_Mcflurry on 4/19/24.
//

import SwiftUI

struct MovieModel: Hashable {
	let title: String
	let image: String
	let count: Int
}

struct MovieSearch: View {
	@State private var searchText = ""
	@State private var item = [
		MovieModel(title: "SF", image: "star", count: 10)
	]

	private let dummy = ["가족", "스릴러", "스유", "유킷", "LSLP 언제 다하지", "돈많은 백수가 꿈입니다"]

	var body: some View {
		List(item, id: \.self) { item in
			NavigationLink("\(item.title) (\(item.count))") {

			}
		}
		.navigationTitle("영화 검색")
		.searchable(text: $searchText, prompt: "영화 검색해주세용")
		.toolbar {
			ToolbarItem(placement: .topBarTrailing) {
				Button("추가") {
					item.append(MovieModel(title: dummy.randomElement()!, image: "star", count: Int.random(in: 0..<100)))
				}
			}
		}
	}
}

#Preview {
	NavigationStack {
		MovieSearch()
	}
}

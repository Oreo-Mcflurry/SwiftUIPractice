//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by A_Mcflurry on 4/19/24.
//

import SwiftUI

struct SectionModel: Hashable {
	let title: String
	let cnt: Int
}

struct RandomImage: View {
	private let section = [
		SectionModel(title: "첫번째 섹션", cnt: 10),
		SectionModel(title: "두번째 섹션", cnt: 5),
		SectionModel(title: "세번째 섹션", cnt: 7),
		SectionModel(title: "네번째 섹션", cnt: 8),
	]

	var body: some View {
		ScrollView {
			ForEach(section, id: \.self) { item in
				ImageView(item: item)
			}
			.padding()
		}
		.navigationTitle("My Random Image")
	}
}

#Preview {
	NavigationStack {
		RandomImage()
	}
}

struct ImageView: View {
	private let url = URL(string: "https://picsum.photos/200/300")!
	let item: SectionModel

	var body: some View {
		VStack(alignment: .leading) {
			titleView
			horizontalImageScrollView
		}
	}

	private var titleView: some View {
		Text(item.title)
			.font(.title)
	}

	private var horizontalImageScrollView: some View {
		ScrollView(.horizontal) {
			HStack {
				ForEach(0..<item.cnt, id: \.self) { _ in
					navigationImageView
				}
			}
		}
	}

	private var navigationImageView: some View {
		NavigationLink {
			imageView
		} label: {
			imageView
		}
	}

	private var imageView: some View {
		AsyncImage(url: url) { image in
			image
				.resizable()
				.frame(width: 100, height: 150)
				.clipShape(RoundedRectangle(cornerRadius: 10))
		} placeholder: {
			ProgressView()
				.frame(width: 100, height: 150)
		}
	}
}

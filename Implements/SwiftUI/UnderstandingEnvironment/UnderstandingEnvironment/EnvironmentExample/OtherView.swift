//
//  OtherView.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/24.
//

import SwiftUI

struct OtherView: View {
	@EnvironmentObject var timer: TimerObject
	
    var body: some View {
		Text(timer.name)
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
		OtherView().environmentObject(TimerObject())
    }
}

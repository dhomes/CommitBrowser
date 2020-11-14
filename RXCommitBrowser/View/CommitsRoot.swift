//
//  CommitsRoot.swift
//  RXCommitBrowser
//
//  Created by dhomes on 11/13/20.
//

import SwiftUI

struct CommitsRoot: View {
    @EnvironmentObject var commitStore: CommitStore

    var body: some View {
        
        NavigationView(content: {
            List(commitStore.commits, id: \.hash) { commit in
                CommitView(commit: commit).onAppear {
                    self.elementOnAppear(commit)
                }
            }
            .navigationTitle("Commits")
            .alert(isPresented: $commitStore.isError, content: {
                    Alert(title: Text("Error"), message: Text(commitStore.error!.localizedDescription), dismissButton: .default(Text("Continue")))
            })

        }).onAppear {
            commitStore.fetch(direction: .top)
        }

    }
    
    private func elementOnAppear(_ commit : Commit) {
        if commitStore.isLast(commit) {
            commitStore.fetch(direction: .bottom)
        }
    }
}

struct CommitsRoot_Previews: PreviewProvider {
    static var previews: some View {
        
        CommitsRoot().environmentObject(CommitStore())
    }
}

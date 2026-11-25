import Foundation
import Supabase

enum SupabaseManager {
    static let client: SupabaseClient = {
        guard let urlString = Bundle.main.infoDictionary?["SUPABASE_URL"] as? String,
              let url = URL(string: urlString),
              let key = Bundle.main.infoDictionary?["SUPABASE_KEY"] as? String else {
            fatalError("Secrets.xcconfig 또는 Info.plist에서 SUPABASE_URL / SUPABASE_KEY를 찾을 수 없습니다.")
        }

        return SupabaseClient(supabaseURL: url, supabaseKey: key)
    }()
}

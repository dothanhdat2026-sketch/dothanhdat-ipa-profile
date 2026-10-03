import SwiftUI

struct ContentView: View {
    @State private var showAbout = false

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.03, green: 0.05, blue: 0.12),
                    Color(red: 0.08, green: 0.12, blue: 0.25),
                    Color(red: 0.02, green: 0.22, blue: 0.32)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 22) {
                    header
                    heroCard
                    passionCard
                    skillsCard
                    quoteCard
                    footer
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 18)
            }
        }
        .sheet(isPresented: $showAbout) {
            AboutView()
        }
    }

    private var header: some View {
        HStack {
            Text("</>")
                .font(.system(size: 25, weight: .black, design: .monospaced))
                .foregroundStyle(.cyan)

            Spacer()

            Text("DEVELOPER")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .tracking(2)
                .foregroundStyle(.white.opacity(0.7))
        }
    }

    private var heroCard: some View {
        VStack(spacing: 18) {
            ZStack {
                Circle()
                    .fill(.cyan.opacity(0.15))
                    .frame(width: 116, height: 116)

                Circle()
                    .stroke(.cyan.opacity(0.6), lineWidth: 2)
                    .frame(width: 106, height: 106)

                Text("ĐTD")
                    .font(.system(size: 28, weight: .black, design: .rounded))
                    .foregroundStyle(.white)
            }

            Text("Đỗ Thành Đạt")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundStyle(.white)

            Text("Passionate Developer")
                .font(.system(size: 17, weight: .medium))
                .foregroundStyle(.cyan)

            Text("Đam mê lập trình, công nghệ và xây dựng những sản phẩm đẹp, nhanh và hữu ích.")
                .multilineTextAlignment(.center)
                .font(.system(size: 15))
                .foregroundStyle(.white.opacity(0.72))
                .lineSpacing(4)

            Button {
                showAbout = true
            } label: {
                HStack {
                    Image(systemName: "person.fill")
                    Text("Xem giới thiệu")
                }
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(.black)
                .padding(.horizontal, 22)
                .padding(.vertical, 13)
                .background(.cyan)
                .clipShape(Capsule())
            }
        }
        .padding(26)
        .background(.white.opacity(0.08))
        .background(.ultraThinMaterial.opacity(0.35))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .overlay {
            RoundedRectangle(cornerRadius: 30)
                .stroke(.white.opacity(0.12), lineWidth: 1)
        }
    }

    private var passionCard: some View {
        InfoCard(icon: "bolt.fill", title: "Đam mê Developer",
                 text: "Luôn tìm hiểu công nghệ mới, tối ưu trải nghiệm và biến ý tưởng thành sản phẩm thực tế.")
    }

    private var skillsCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Tech & Skills", systemImage: "chevron.left.forwardslash.chevron.right")
                .font(.headline)
                .foregroundStyle(.white)

            HStack {
                Skill(name: "SwiftUI", icon: "swift")
                Skill(name: "iOS", icon: "iphone")
                Skill(name: "Web", icon: "globe")
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }

    private var quoteCard: some View {
        VStack(spacing: 10) {
            Image(systemName: "quote.opening")
                .foregroundStyle(.cyan)
                .font(.title2)

            Text("“Code không chỉ là viết chương trình — đó là cách biến ý tưởng thành trải nghiệm.”")
                .multilineTextAlignment(.center)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundStyle(.white.opacity(0.85))
        }
        .padding(22)
        .frame(maxWidth: .infinity)
        .background(.cyan.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }

    private var footer: some View {
        Text("© 2026 Đỗ Thành Đạt • Developer")
            .font(.caption)
            .foregroundStyle(.white.opacity(0.45))
            .padding(.bottom, 12)
    }
}

struct InfoCard: View {
    let icon: String
    let title: String
    let text: String

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.cyan)
                .frame(width: 42, height: 42)
                .background(.cyan.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 13))

            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.white)
                Text(text)
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.65))
                    .lineSpacing(3)
            }
        }
        .padding(20)
        .background(.white.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

struct Skill: View {
    let name: String
    let icon: String

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(.cyan)
            Text(name)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.75))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 13)
        .background(.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct AboutView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 82))
                    .foregroundStyle(.cyan)

                Text("Đỗ Thành Đạt")
                    .font(.largeTitle.bold())

                Text("Developer • Creator • Technology Enthusiast")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)

                Text("Đỗ Thành Đạt là một người đam mê Developer, yêu thích việc học hỏi, thử nghiệm công nghệ và tạo ra những sản phẩm có giao diện hiện đại, dễ sử dụng.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Spacer()
            }
            .padding(.top, 45)
            .navigationTitle("Giới thiệu")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Đóng") { dismiss() }
                }
            }
        }
    }
}

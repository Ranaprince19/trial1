import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack {
            // Background Color/Gradient
            Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all)
            
            // Decorative shapes to give it the glassy, colorful modern app look
            GeometryReader { proxy in
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.3), Color.pink.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 300, height: 300)
                    .blur(radius: 60)
                    .position(x: 50, y: 50)
                
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.4), Color.orange.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 250, height: 250)
                    .blur(radius: 50)
                    .position(x: proxy.size.width - 50, y: 200)
            }
            .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    
                    // Header Section
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("👋 Hi Ravi,")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text("Stay Safe Today")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        Spacer()
                        HStack(spacing: 4) {
                            Text("📍")
                            Text("Bangalore Zone 3")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.secondary)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color(.systemBackground).opacity(0.7))
                        .clipShape(Capsule())
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    // Worker Protection Card
                    VStack(spacing: 16) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Worker Protection")
                                    .font(.headline)
                                Text("Standard ₹49/week")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            HStack(spacing: 4) {
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 8, height: 8)
                                Text("Active")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(Color.green.opacity(0.1))
                            .clipShape(Capsule())
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("Coverage Left")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("₹700")
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                        
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(height: 8)
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.6), Color.red]), startPoint: .leading, endPoint: .trailing))
                                    .frame(width: geometry.size.width * 0.7, height: 8)
                            }
                        }
                        .frame(height: 8)
                    }
                    .padding()
                    .background(Color(.systemBackground).opacity(0.85))
                    .cornerRadius(24)
                    .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
                    .padding(.horizontal)
                    
                    // Risk Meter Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Today's Risk Level")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        HStack(spacing: 12) {
                            RiskLevelView(emoji: "🟢", label: "Low", isActive: false)
                            RiskLevelView(emoji: "🟡", label: "Medium", isActive: true)
                            RiskLevelView(emoji: "🔴", label: "High", isActive: false)
                        }
                        .padding(.horizontal)
                    }
                    
                    // Live Monitoring Section
                    HStack(spacing: 12) {
                        MonitorCardView(emoji: "🌧️", title: "Rain", value: "Heavy", color: .blue)
                        MonitorCardView(emoji: "💨", title: "AQI", value: "280", color: .orange)
                        MonitorCardView(emoji: "🔻", title: "Orders", value: "Low", color: .red)
                    }
                    .padding(.horizontal)
                    
                    // Active Trigger Alert Section
                    HStack(alignment: .center, spacing: 16) {
                        Text("⚠️")
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Heavy Rain Detected")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                            Text("You may experience income loss")
                                .font(.caption)
                                .foregroundColor(Color.red.opacity(0.8))
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.red.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.red.opacity(0.3), lineWidth: 1)
                    )
                    .cornerRadius(16)
                    .padding(.horizontal)
                    
                    // Earnings Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Earnings Overview")
                            .font(.headline)
                        
                        VStack(spacing: 12) {
                            EarningRowView(label: "Expected", value: "₹800", isLoss: false)
                            EarningRowView(label: "Actual", value: "₹450", isLoss: false)
                            EarningRowView(label: "Loss", value: "₹350", isLoss: true)
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground).opacity(0.85))
                    .cornerRadius(24)
                    .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
                    .padding(.horizontal)
                    
                    Spacer(minLength: 40)
                }
            }
        }
    }
}

// MARK: - Subcomponents

struct RiskLevelView: View {
    var emoji: String
    var label: String
    var isActive: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Text(emoji)
                .font(.title2)
                .grayscale(isActive ? 0 : 1)
                .opacity(isActive ? 1 : 0.5)
                .scaleEffect(isActive ? 1.1 : 1.0)
            
            Text(label)
                .font(.caption)
                .fontWeight(isActive ? .bold : .medium)
                .foregroundColor(isActive ? .primary : .secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(Color(.systemBackground).opacity(isActive ? 1 : 0.4))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(isActive ? 0.08 : 0), radius: 8, x: 0, y: 4)
    }
}

struct MonitorCardView: View {
    var emoji: String
    var title: String
    var value: String
    var color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Text(emoji)
                .font(.title2)
                .frame(width: 44, height: 44)
                .background(Color(.systemBackground))
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
            
            Text(title.uppercased())
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.secondary)
            
            Text(value)
                .font(.subheadline)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(color.opacity(0.1))
        .cornerRadius(20)
    }
}

struct EarningRowView: View {
    var label: String
    var value: String
    var isLoss: Bool
    
    var body: some View {
        HStack {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(isLoss ? .red : .secondary)
            Spacer()
            Text(value)
                .font(.headline)
                .foregroundColor(isLoss ? .red : (label == "Expected" ? .green : .primary))
        }
        .padding()
        .background(Color(.systemBackground).opacity(isLoss ? 0 : 0.5))
        .background(isLoss ? Color.red.opacity(0.05) : Color.clear)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isLoss ? Color.red.opacity(0.2) : Color.gray.opacity(0.1), lineWidth: 1)
        )
    }
}

// SwiftUI Preview Provider
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

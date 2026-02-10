# Weather App 🌤️

A professional, clean, and intuitive weather forecast application built with Flutter. This app provides real-time weather information, hourly forecasts, and detailed atmospheric data for cities worldwide.

## ✨ Features

- **Real-time Weather**: Current temperature, sky conditions, and location details.
- **Hourly Forecast**: Interactive horizontal scroll for upcoming weather changes.
- **Detailed Insights**: Humidity, Wind Speed, and Atmospheric Pressure tracking.
- **Dynamic UI**: Responsive design with frosted glass effects (BackdropFilter) and adaptive indicators.
- **Refresh Capability**: Quickly update weather data with a single tap.

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (v3.10.8 or higher)
- [Dart SDK](https://dart.dev/get-dart)
- An API Key from [OpenWeatherMap](https://openweathermap.org/api)

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Natnael-Tilahun/weather-app.git
   cd weather_app
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Environment Setup:**
   Create a `.env` file in the root directory and add your OpenWeatherMap API key:

   ```env
   API_KEY=your_api_key_here
   ```

4. **Run the application:**
   ```bash
   flutter run
   ```

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **API**: [OpenWeatherMap API](https://openweathermap.org/api)
- **Libraries**:
  - `http`: For network requests.
  - `flutter_dotenv`: For managing environment variables.
  - `intl`: For date and time formatting.
  - `skeletonizer`: For elegant loading states.

## 📂 Project Structure

```text
lib/
├── main.dart                 # Application entry point
├── weather_app_screen.dart    # Main UI and logic
├── hourly_forcast_item.dart  # Reusable hourly forecast widget
└── additional_info_item.dart # Reusable info display widget
```

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Built with ❤️ by [Natnael Tilahun](https://github.com/Natnael-Tilahun)

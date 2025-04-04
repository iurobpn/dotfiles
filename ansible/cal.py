from textual.app import App
from textual.widgets import Static
import calendar

class CalendarApp(App):
    def compose(self):
        yield Static(self.generate_calendar())

    def generate_calendar(self):
        # Generate calendar data for a specific month and year
        month_calendar = calendar.month(2025, 4)
        return month_calendar

if __name__ == "__main__":
    app = CalendarApp()
    app.run()


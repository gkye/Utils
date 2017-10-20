import Foundation

fileprivate let formatter: DateFormatter = {
	let formatter = DateFormatter()
	formatter.dateFormat = "dd/MM/yyyy"
	formatter.locale = Locale.current
	return formatter
}()

//Date
extension Date {

    func isBetween(_ beginDate: Date, and endDate: Date) -> Bool {
        if self.compare(beginDate) == .orderedAscending {
            return false
        }

        if self.compare(endDate) == .orderedDescending {
            return false
        }

        return true
    }

    func dayAfter() -> Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }

    func futureDates() -> [Date] {
        var dayArray = [self]

        for i in 0 ..< 30 {
            dayArray.append(dayArray[i].dayAfter())
        }

        return dayArray
    }
    
    	func isSameDay(as otherDate: Date) -> Bool {
		let order = Calendar.current.compare(self, to: otherDate, toGranularity: .day)
		switch order {
		case .orderedSame: return true
		default: return false
		}
	}
	
    public func days(since date: Date) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff / 86_400)
        return diff
    }

    public func hours(since date: Date) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff / 3600)
        return diff
    }

    public func minutes(since date: Date) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff / 60)
        return diff
    }

    public func seconds(since date: Date) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff)
        return diff
    }

	func getComponents(secondDate: Date) -> DateComponents{
		let calendar = Calendar.current
		// Replace the hour (time) of both dates with 00:00
		let date1 = calendar.startOfDay(for: secondDate)
		let date2 = calendar.startOfDay(for: Date())
		return  calendar.dateComponents([.day, .calendar], from: date1, to: date2)
	}

	public func formatDateToString(format: String) -> String{
		formatter.dateFormat = format
		let stringDate = formatter.string(from: self)
		return stringDate
	}
	
  /// Get years between current date and given date
  ///
  /// - Parameter date: date to be compared
  /// - Returns: years between date or 0 if nil
  static func yearsTo(_ date : Date) -> Int{
   return Calendar.current.dateComponents([.year], from: Date(), to: date).year ?? 0
  }
}

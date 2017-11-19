json.array! @reservations do |reservation|

  json.id     reservation.id
  json.title  reservation.user.username
  json.start  reservation.start_time
  json.end    (reservation.end_time  + 1.day)
  json.url    reservation_url(reservation, format: :html)
end

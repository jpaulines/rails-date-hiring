import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr(".datepicker", {
  altInput: true,
  allowInput: true,
  plugins: [new rangePlugin({ input: "#range_end"})]
})

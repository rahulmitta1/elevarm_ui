import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum ElevarmSelectDateRangeBottomSheetOption {
  allTime,
  today,
  oneWeek,
  oneMonth,
  threeMonths,
  fourMonths,
  oneYear,
  lastYear,
  selectYear,
  selectDateRange,
}

void showElevarmSelectDateRangeBottomSheet({
  required BuildContext context,
  required VoidCallback onPressedClose,
  required VoidCallback onPressedReset,
  required final void Function(
    DateTimeRange?,
    ElevarmSelectDateRangeBottomSheetOption?,
  ) onPressedActivate,
  ElevarmSelectDateRangeBottomSheetOption? initialOption =
      ElevarmSelectDateRangeBottomSheetOption.allTime,
  int? selectedYear,
  DateTimeRange? selectedDateRange,
  int minYear = 10,
  int maxYear = 10,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: const Color.fromRGBO(0, 0, 0, 0.35),
    builder: (BuildContext contextLocal) {
      return ElevarmSelectDateRangeBottomSheet(
        onPressedClose: onPressedClose,
        onPressedReset: onPressedReset,
        onPressedActivate: onPressedActivate,
        minYear: minYear,
        maxYear: maxYear,
        initialOption: initialOption,
        selectedYear: selectedYear,
        selectedDateRange: selectedDateRange,
      );
    },
  );
}

class ElevarmSelectDateRangeBottomSheet extends StatefulWidget {
  /// Click handler for back button.
  final VoidCallback onPressedClose;
  final VoidCallback onPressedReset;
  final void Function(DateTimeRange?, ElevarmSelectDateRangeBottomSheetOption?)
      onPressedActivate;
  final int minYear;
  final int maxYear;
  final ElevarmSelectDateRangeBottomSheetOption? initialOption;
  final int? selectedYear;
  final DateTimeRange? selectedDateRange;
  const ElevarmSelectDateRangeBottomSheet({
    required this.onPressedClose,
    required this.onPressedReset,
    required this.onPressedActivate,
    required this.minYear,
    required this.maxYear,
    this.initialOption = ElevarmSelectDateRangeBottomSheetOption.allTime,
    this.selectedYear,
    this.selectedDateRange,
    super.key,
  });

  @override
  State<ElevarmSelectDateRangeBottomSheet> createState() =>
      _DateRangeBottomSheetState();
}

class _DateRangeBottomSheetState
    extends State<ElevarmSelectDateRangeBottomSheet> {
  ElevarmSelectDateRangeBottomSheetOption? _selectedOption;
  DateTimeRange? dateRanges;

  final dateTimeNow = DateTime.now();
  final dateTextCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();

    _selectedOption = widget.initialOption;
    // initial value for radio button
    _setFromRadioFilterDateRange(widget.initialOption!);

    // initial value textfield date picker
    dateTextCtrl.text = widget.selectedDateRange != null
        ? _setTitleTextFieldDateRange(widget.selectedDateRange!)
        : '';

    // initial value for dropdown years
    if (widget.initialOption ==
        ElevarmSelectDateRangeBottomSheetOption.selectYear) {
      assert(
        widget.selectedYear != null,
        'selectedYear should not be null when option is selectYear',
      );
      dateRanges = _setDateTimeRange(
        DateTime(widget.selectedYear!),
        DateTime(widget.selectedYear!, 12, 31),
      );
    }

    // initial value for date range picker
    if (widget.initialOption ==
        ElevarmSelectDateRangeBottomSheetOption.selectDateRange) {
      assert(
        widget.selectedDateRange != null,
        'selectedDateRange should not be null when option is selectDateRange',
      );
      dateRanges = widget.selectedDateRange!;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool showSelectYearInput =
        _selectedOption == ElevarmSelectDateRangeBottomSheetOption.selectYear;
    bool showSelectDateRangeInput = _selectedOption ==
        ElevarmSelectDateRangeBottomSheetOption.selectDateRange;

    return ElevarmBottomSheet(
      title: 'Pilih Tanggal',
      // initialChildSize: 0.5,
      maxChildSize: 0.7,
      initialChildSize: 0.7,
      onPressedClose: widget.onPressedClose,
      children: [
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                ElevarmRadioButton(
                  size: ElevarmRadioButtonSize.sm,
                  value: ElevarmSelectDateRangeBottomSheetOption.allTime,
                  title: 'All Time',
                  groupValue: _selectedOption,
                  onChanged: _handleChangedOption,
                ),
                const SizedBox(height: 12),
                ElevarmRadioButton(
                  size: ElevarmRadioButtonSize.sm,
                  value: ElevarmSelectDateRangeBottomSheetOption.today,
                  title: 'Hari ini',
                  groupValue: _selectedOption,
                  onChanged: _handleChangedOption,
                ),
                const SizedBox(height: 12),
                ElevarmRadioButton(
                  size: ElevarmRadioButtonSize.sm,
                  value: ElevarmSelectDateRangeBottomSheetOption.oneWeek,
                  title: '1 Minggu Terakhir',
                  groupValue: _selectedOption,
                  onChanged: _handleChangedOption,
                ),
                const SizedBox(height: 12),
                ElevarmRadioButton(
                  size: ElevarmRadioButtonSize.sm,
                  value: ElevarmSelectDateRangeBottomSheetOption.oneMonth,
                  title: '1 Bulan Terakhir',
                  groupValue: _selectedOption,
                  onChanged: _handleChangedOption,
                ),
                const SizedBox(height: 12),
                ElevarmRadioButton(
                  size: ElevarmRadioButtonSize.sm,
                  value: ElevarmSelectDateRangeBottomSheetOption.threeMonths,
                  title: '3 Bulan Terakhir',
                  groupValue: _selectedOption,
                  onChanged: _handleChangedOption,
                ),
                const SizedBox(height: 12),
                ElevarmRadioButton(
                  size: ElevarmRadioButtonSize.sm,
                  value: ElevarmSelectDateRangeBottomSheetOption.fourMonths,
                  title: '4 Bulan Terakhir',
                  groupValue: _selectedOption,
                  onChanged: _handleChangedOption,
                ),
                const SizedBox(height: 12),
                ElevarmRadioButton(
                  size: ElevarmRadioButtonSize.sm,
                  value: ElevarmSelectDateRangeBottomSheetOption.oneYear,
                  title: '1 Tahun Terakhir',
                  groupValue: _selectedOption,
                  onChanged: _handleChangedOption,
                ),
                const SizedBox(height: 12),
                ElevarmRadioButton(
                  size: ElevarmRadioButtonSize.sm,
                  value: ElevarmSelectDateRangeBottomSheetOption.lastYear,
                  title: 'Tahun Lalu',
                  groupValue: _selectedOption,
                  onChanged: _handleChangedOption,
                ),
                const ElevarmDivider(height: 24.0),
                ElevarmRadioButton(
                  size: ElevarmRadioButtonSize.sm,
                  value: ElevarmSelectDateRangeBottomSheetOption.selectYear,
                  title: 'Pilih Tahun Lainnya',
                  groupValue: _selectedOption,
                  onChanged: _handleChangedOption,
                ),
                const SizedBox(height: 12),
                showSelectYearInput
                    ? _buildChooseAnotherYears(
                        context,
                        widget.minYear,
                        widget.maxYear,
                      )
                    : Container(),
                ElevarmRadioButton(
                  size: ElevarmRadioButtonSize.sm,
                  value:
                      ElevarmSelectDateRangeBottomSheetOption.selectDateRange,
                  title: 'Pilih Tanggal Sendiri',
                  groupValue: _selectedOption,
                  onChanged: _handleChangedOption,
                ),
                showSelectDateRangeInput
                    ? _buildSelectDateRange(context)
                    : Container(),
                const SizedBox(height: 36),
                Row(
                  children: [
                    Expanded(
                      child: ElevarmOutlineButton.text(
                        text: 'Reset',
                        onPressed: widget.onPressedReset,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevarmPrimaryButton.text(
                        text: 'Konfirmasi',
                        onPressed: dateRanges != null
                            ? () {
                                widget.onPressedActivate(
                                  dateRanges,
                                  _selectedOption,
                                );
                              }
                            : null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

// Set value for dropdown select date range picker
  Widget _buildSelectDateRange(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tentukan periode maks. setahun ke depan atau belakang dari tanggal pilihanmu', // ignore: lines_longer_than_80_chars
            style: LibraryTextStyles.interXsRegularNeutral400,
          ),
          const SizedBox(height: 12.0),
          ElevarmTextInputField(
            label: null,
            prefixIconAssetName: ElevarmIconsOutline.calendar,
            controller: dateTextCtrl,
            hintText: 'DD/MM/YYYY',
            onTapSuffix: null,
            errorText: null,
            enabled: true,
            readOnly: true,
            onTap: () {
              showElevarmDatePickerDialog(
                initialSelectedRange: dateRanges,
                context: context,
                mode: ElevarmDatePickerMode.range,
                maxDate: _setAddDate(360),
                minDate: _setSubTractDate(360),
              ).then(
                (pickedDate) {
                  FocusManager.instance.primaryFocus?.unfocus();

                  if (pickedDate == null) {
                    return;
                  }

                  setState(() {
                    dateTextCtrl.text = _setTitleTextFieldDateRange(pickedDate);
                  });
                  dateRanges = pickedDate;
                },
              );
            },
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }

  // Set title textfield date range
  String _setTitleTextFieldDateRange(DateTimeRange selectDateTimeRange) {
    List<String> dates = selectDateTimeRange.toString().split(' - ');
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String formattedStartDate = dateFormat.format(DateTime.parse(dates[0]));
    String formattedEndDate = dateFormat.format(DateTime.parse(dates[1]));

    return '$formattedStartDate - $formattedEndDate';
  }

  // Set data to type DateTimeRange
  DateTimeRange _setDateTimeRange(DateTime start, DateTime end) {
    DateTimeRange dateTimeRange = DateTimeRange(
      start: start,
      end: end,
    );
    return dateTimeRange;
  }

  // Ignore value if selected selectYear and selectDateRange
  void _handleChangedOption(ElevarmSelectDateRangeBottomSheetOption value) {
    setState(() {
      _selectedOption = value;

      _setFromRadioFilterDateRange(value);
    });
  }

  // Set datetime for today
  DateTime _setForToday() {
    DateTime startOfToday = DateTime(
      dateTimeNow.year,
      dateTimeNow.month,
      dateTimeNow.day,
      0,
      0,
      0,
      0,
    );
    return startOfToday;
  }

  // Set datetime based subtract (-)
  DateTime _setSubTractDate(int? subTractDate) {
    DateTime subTractedDate =
        dateTimeNow.subtract(Duration(days: subTractDate!));
    return subTractedDate;
  }

  // Set datetime based add date (+)
  DateTime _setAddDate(int? addDate) {
    DateTime addedDate = DateTime.now().add(Duration(days: addDate!));
    return addedDate;
  }

  // Set value for radio button select
  void _setFromRadioFilterDateRange(
    ElevarmSelectDateRangeBottomSheetOption value,
  ) {
    DateTimeRange? dateRange;
    ElevarmSelectDateRangeBottomSheetOption? selectedOptions;
    if (value == ElevarmSelectDateRangeBottomSheetOption.allTime) {
      dateRange = _setDateTimeRange(DateTime(1970, 01, 01), dateTimeNow);
      selectedOptions = ElevarmSelectDateRangeBottomSheetOption.allTime;
    } else if (value == ElevarmSelectDateRangeBottomSheetOption.today) {
      dateRange = _setDateTimeRange(_setForToday(), dateTimeNow);
      selectedOptions = ElevarmSelectDateRangeBottomSheetOption.today;
    } else if (value == ElevarmSelectDateRangeBottomSheetOption.oneWeek) {
      dateRange = _setDateTimeRange(_setSubTractDate(7), dateTimeNow);
      selectedOptions = ElevarmSelectDateRangeBottomSheetOption.oneWeek;
    } else if (value == ElevarmSelectDateRangeBottomSheetOption.oneMonth) {
      dateRange = _setDateTimeRange(_setSubTractDate(30), dateTimeNow);
      selectedOptions = ElevarmSelectDateRangeBottomSheetOption.oneMonth;
    } else if (value == ElevarmSelectDateRangeBottomSheetOption.threeMonths) {
      dateRange = _setDateTimeRange(_setSubTractDate(90), dateTimeNow);
      selectedOptions = ElevarmSelectDateRangeBottomSheetOption.threeMonths;
    } else if (value == ElevarmSelectDateRangeBottomSheetOption.fourMonths) {
      dateRange = _setDateTimeRange(_setSubTractDate(120), dateTimeNow);
      selectedOptions = ElevarmSelectDateRangeBottomSheetOption.fourMonths;
    } else if (value == ElevarmSelectDateRangeBottomSheetOption.oneYear) {
      dateRange = _setDateTimeRange(_setSubTractDate(360), dateTimeNow);
      selectedOptions = ElevarmSelectDateRangeBottomSheetOption.oneYear;
    } else if (value == ElevarmSelectDateRangeBottomSheetOption.lastYear) {
      dateRange = _setDateTimeRange(
        DateTime(dateTimeNow.year - 1),
        DateTime(dateTimeNow.year - 1, 12, 31),
      );
      selectedOptions = ElevarmSelectDateRangeBottomSheetOption.lastYear;
    } else if (value == ElevarmSelectDateRangeBottomSheetOption.selectYear) {
      if (widget.selectedYear != null) {
        dateRange = _setDateTimeRange(
          DateTime(widget.selectedYear!),
          DateTime(widget.selectedYear!, 12, 31),
        );
      }
      selectedOptions = ElevarmSelectDateRangeBottomSheetOption.selectYear;
    } else if (value ==
        ElevarmSelectDateRangeBottomSheetOption.selectDateRange) {
      if (widget.selectedDateRange != null) {
        dateRange = widget.selectedDateRange!;
      }
      selectedOptions = ElevarmSelectDateRangeBottomSheetOption.selectDateRange;
    }

    setState(() {
      dateRanges = dateRange;
      _selectedOption = selectedOptions;
    });
  }

  // Set value for dropdown select years
  Widget _buildChooseAnotherYears(
    BuildContext context,
    int minYear,
    int maxYear,
  ) {
    List<String> getYearsList = [];
    DateTime startYears = DateTime(dateTimeNow.year - minYear);
    DateTime endYears = DateTime(dateTimeNow.year + maxYear);
    for (int i = startYears.year; i <= endYears.year; i++) {
      getYearsList.add(i.toString());
    }

    return Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 12.0),
      child: ElevarmDropdownInputField(
        hintText: 'Pilih tahun',
        initialValue:
            widget.selectedYear != null ? widget.selectedYear.toString() : '',
        options: getYearsList
            .map(
              (e) => ElevarmDropdownInputFieldOption(
                value: e,
                title: e,
              ),
            )
            .toList(),
        onChanged: (String? result) {
          setState(() {
            dateRanges = _setDateTimeRange(
              DateTime(int.parse(result!), 01, 01),
              DateTime(int.parse(result), 12, 31),
            );
          });
        },
      ),
    );
  }
}

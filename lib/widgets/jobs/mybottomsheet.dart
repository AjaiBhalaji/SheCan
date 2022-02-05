import 'package:flutter/material.dart';
import 'bottomsheet.dart';
import 'experiencelevelwidget.dart';
import 'package:provider/provider.dart';

class MyBottomSheet extends StatefulWidget {
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class JobTypes {
  final String title;
  bool? checked;
  final int count;

  JobTypes({required this.title, this.checked, required this.count});
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  List<JobTypes> jobTypes = [
    JobTypes(title: "Full-Time", checked: false, count: 135),
    JobTypes(title: "Part-Time", checked: false, count: 235),
    JobTypes(title: "Contract", checked: false, count: 39),
    JobTypes(title: "Internship", checked: false, count: 59),
    JobTypes(title: "Temporary", checked: false, count: 21),
    JobTypes(title: "Commission", checked: false, count: 3),
  ];
  RangeValues _rangeValues = RangeValues(0, 300000);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Salary Estimate",
          ),
          RangeSlider(
            min: 0,
            max: 300000,
            values: _rangeValues,
            onChanged: (rangeValue) {
              setState(() {
                _rangeValues = rangeValue;
              });
            },
            labels: RangeLabels(
                _rangeValues.start.toString(), _rangeValues.end.toString()),
          ),
          Text(
            "Job Type",
          ),
          GridView.count(
            shrinkWrap: true,
            childAspectRatio: 3,
            crossAxisCount: 2,
            children: List.generate(
              jobTypes.length,
              (i) {
                return Row(
                  children: <Widget>[
                    Checkbox(
                      value: jobTypes[i].checked,
                      onChanged: (value) {
                        setState(() {
                          jobTypes[i].checked = value;
                        });
                      },
                    ),
                    Text("${jobTypes[i].title} (${jobTypes[i].count})"),
                  ],
                );
              },
            ),
          ),
          Text(
            "Experience Level",
          ),
          ExperienceLevelWidget(),
          Container(
            height: 40,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                "Submit",
              ),
              onPressed: () =>
                  Provider.of<MyBottomSheetModel>(context).changeState(),
            ),
          )
        ],
      ),
    );
  }
}

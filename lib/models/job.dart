class JobModel {
  final String description, iconUrl, location, salary, title;
  final List<String> photos;

  JobModel(
      {required this.photos,
      required this.description,
      required this.iconUrl,
      required this.location,
      required this.salary,
      required this.title});
}

List<JobModel> jobList = [
  JobModel(
    description:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum culpa ab vitae, totam voluptatum laudantium excepturi accusantium, incidunt sunt quos nihil, odit consequuntur non modi vel veniam. Eligendi, dicta? Eius.",
    iconUrl:
        "https://image.shutterstock.com/image-photo/modern-hospital-style-building-260nw-212251981.jpg",
    location: "Austin, TX",
    title: "Flutter Developer",
    salary: "\$70,000 - 120,000\$",
    photos: [
      "https://image.shutterstock.com/image-photo/modern-hospital-style-building-260nw-212251981.jpg",
      "https://image.shutterstock.com/image-photo/modern-hospital-style-building-260nw-212251981.jpg",
     
    ],
  ),
  
];

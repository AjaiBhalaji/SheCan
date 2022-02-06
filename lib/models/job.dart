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
        "The Technology Intermediate Business Analyst is an intermediate-level position responsible for liaising between business users and technologists to exchange information in a concise, logical and understandable way in coordination with the Technology team. The overall objective of this role is to contribute to continuous iterative exploration and investigation of business performance and other measures to gain insight and drive business planning.",
    iconUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOJ7U0Qwh9KxFRwKxnIjYPlm4F_t-QTAiQwA&usqp=CAU",
    location: "New York,America",
    title: "Business Analyst",
    salary: "\$70,000 - 120,000\$",
    photos: [
      "https://image.shutterstock.com/image-photo/modern-hospital-style-building-260nw-212251981.jpg",
      "https://image.shutterstock.com/image-photo/modern-hospital-style-building-260nw-212251981.jpg",
    ],
  ),
  JobModel(
    description:
        "The Customer Remediation Analytics team is looking for some new team members, which play a critical role of performing analytics activities customer remediation population identification, remediation execution and exploratory analytics as well as transactional testing.",
    iconUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-m19aKUeQS6Z5RSuKE9GC9JzIEBwv8vBOxQ&usqp=CAU",
    location: "California,America",
    title: "Analytics Consultant",
    salary: "\$70,000 - 120,000\$",
    photos: [
      "https://image.shutterstock.com/image-photo/modern-hospital-style-building-260nw-212251981.jpg",
      "https://image.shutterstock.com/image-photo/modern-hospital-style-building-260nw-212251981.jpg",
    ],
  ),
];

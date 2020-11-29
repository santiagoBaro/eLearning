class BookElement {
  int id;
  String type;
  String stringElements;
  List<String> elements;

  BookElement({
    this.id,
    this.type,
    this.elements,
    this.stringElements,
  });

  BookElement.fromJson(Map<String, dynamic> json)
      : id = json['_id'] ?? 0,
        type = json['tipo'] ?? "",
        elements = json['contenido'].split(",");

  Map<String, dynamic> toJson() => {
        'tipo': type,
        'contenido': elements.join(","),
      };

  Map<String, dynamic> toStringJson() => {
        'tipo': type,
        'contenido': stringElements,
      };
}

List<String> fromJsonList(String string) {
  return string.split(",");
}

enum ElementType {
  image,
  list,
  multiple_choice,
  paragraph,
  question,
  title,
  subtitle,
  video
}

List<BookElement> testBook = [
  BookElement(
    elements: ['Bienvenidos al curso de Calculo'],
    type: "title",
  ),
  BookElement(
    elements: [
      'Enim sit quia enim sed et explicabo vitae est. Cupiditate aut perferendis eius harum. Temporibus hic tenetur. Qui neque et eveniet dolorem delectus ab libero ea quasi. At et quisquam commodi dicta eius.'
    ],
    type: "paragraph",
  ),
  BookElement(
    elements: [
      'Est nihil velit ut ab et velit consectetur et. Aliquam ut dolorem veritatis repudiandae explicabo. Eos iure facilis laudantium omnis aperiam eos qui debitis et. Quia quia explicabo debitis delectus autem tempora.'
    ],
    type: "paragraph",
  ),
  BookElement(
    elements: [
      'https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/132595909/original/617cedfdc6b6629143b0047669fb65f0336c59cd/make-any-graph-or-chart-or-analytic-design-in-high-quality.png'
    ],
    type: "image",
  ),
  BookElement(
    elements: [
      'natus repellendus doloremque',
      'tempore quas eaque',
      'possimus ut reiciendis',
      'quos harum nobis'
    ],
    type: "list",
  ),
  BookElement(
    elements: ['Aliquid repellendus distinctio sit dolores?', '9942343825'],
    type: "question",
  ),
  BookElement(
    elements: ['Autem est sunt nobis cum est perferendis.'],
    type: "subtitle",
  ),
  BookElement(
    elements: [
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
    ],
    type: "video",
  ),
  BookElement(
    elements: [
      'Earum consequatur dolores possimus. Non molestiae quos. Iure quas vel reprehenderit voluptatem atque aut ex. Eos eos omnis. Sit voluptas tenetur quas ducimus mollitia alias laboriosam corrupti. Quia sint dolor omnis qui error mollitia. Consequatur maiores autem. Consequatur et voluptas quo reprehenderit non. Earum nihil quo.Sed dolores qui id reprehenderit sed dolores facere consequatur. Consequatur ut fugit possimus eos quia. Rerum provident rerum saepe repellat nesciunt dignissimos cupiditate laudantium voluptas. Consequatur omnis et necessitatibus. Necessitatibus rerum pariatur et. Asperiores quis iste eligendi qui laborum odit ab culpa at.'
    ],
    type: "paragraph",
  ),
  BookElement(
    elements: [
      '2',
      'Quia quod illum voluptatem autem molestiae et ducimus',
      'Enim fugit nulla alias odio voluptas quam',
      'natus aut soluta',
      'Quibusdam qui nisi.',
      'Iusto aut quas.'
    ],
    type: "multiple_choise",
  ),
  BookElement(
    elements: [
      'https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/132595909/original/617cedfdc6b6629143b0047669fb65f0336c59cd/make-any-graph-or-chart-or-analytic-design-in-high-quality.png'
    ],
    type: "image",
  ),
  BookElement(
    elements: ['Bienvenidos al curso de Calculo'],
    type: "title",
  ),
  BookElement(
    elements: [
      'Necessitatibus cum voluptas consequatur quas. Omnis perspiciatis quo. Sint atque sint.'
    ],
    type: "paragraph",
  ),
  BookElement(
    elements: ['Voluptatem et nemo a consequatur voluptates?'],
    type: "question",
  ),
];

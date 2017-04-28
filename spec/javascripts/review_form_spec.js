// describe("ReviewForm", function() {
//   var form, reviewForm;
//
//   beforeEach(function() {
//     form = $([
//       '<form class="new_review" id="new_review"',
//       'action="/motorcycles/1/reviews" accept-charset="UTF-8" method="post">',
//       '<input name="utf8" type="hidden" value="✓"><input type="hidden"',
//       'name="authenticity_token" value="1SCs/l7q57W8Pz1NCK1rbe8U4Ur/cqba0Yfh',
//       'XlLMTrErveyKu14lZNQaUtiuNRBj6MnfOwvSRtf1JYXhRruftQ==">',
//       '<div class="field"> <label for="review_title">Title</label><br>',
//       '<input type="text" name="review[title]" id="review_title">',
//       '</div><div class="field"> <label for="review_review">Review</label><br>',
//       '<textarea name="review[description]" id="review_description"></textarea>',
//       '</div> <div class="actions"> <input type="submit" name="commit"',
//       'value="Create Review" data-disable-with="Create Review"> </div> </form>'
//     ].join('\n'));
//
//     reviewForm = newReviewForm(form);
//
//     form.find("#review_title").val("Super awesome motorcycle!");
//     form.find("#review_description").val("Ian rides this motorcycle so it's automatically the best one ever made in the history of time");
//   });
//
//   describe("new", function() {
//     it("creates a new ReviewForm object", function() {
//       expect(reviewForm).toBeDefined();
//     });
//   });
// });

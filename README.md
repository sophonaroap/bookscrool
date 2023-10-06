# bookscrool
ios app allows user to read a selection of online books, normally broken up by chapter on different web pages, with ergo scrolling


## soph-core

soph-core is a django app that provides a restful api for the bookscroll app and other functionality


### endpoints

/bookscroll/books/
/bookscroll/books/<int:pk>/

```python
app_name = "bookscroll"
urlpatterns = [
    path("books/", BookListView.as_view(), name="books"),
    path("books/<int:pk>/", BookDetailView.as_view(), name="book-detail")
]
```

#### payload

```json
[
            {
                "title": "self.title",
                "chapter_set": [
                    {
                        "title": "Chapter 1",
                        "text": "self.chapter1",
                        "next": "chapter2"
                    },
                    {
                        "title": "Chapter 2",
                        "text": "self.chapter2",
                        "next": "chapter3"
                    },
                    {
                        "title": "Chapter 3",
                        "text": "self.chapter3",
                        "next": "None"
                    }
                ]
            },
            {
                "title": "self.title1",
                "chapter_set": [
                    {
                        "title": "Chapter 1",
                        "text": "self.chapter11",
                        "next": "chapter2"
                    },
                    {
                        "title": "Chapter 2",
                        "text": "self.chapter22",
                        "next": "chapter3"
                    },
                    {
                        "title": "Chapter 3",
                        "text": "self.chapter33",
                    }
                ]
            }
        ]
```

#### models

```python
class Chapter(BaseModel):
    title = models.CharField(max_length=100)
    text = models.TextField()
    next = models.CharField(max_length=100, null=True, blank=True)

    book = models.ForeignKey("Book", on_delete=models.CASCADE)


class Book(BaseModel):
    title = models.CharField(max_length=100, unique=True)
```

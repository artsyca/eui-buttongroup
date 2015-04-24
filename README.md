# Eui-buttongroup

Implement a buttongroup component using `eui-button`

## Installation

Add this to your `package.json`:

```
eui-buttongroup: "git://git@github.com:artsyca/eui-buttongroup.git"
```

## Usage

This component follows a typical pattern:

```
{{{eui-buttongroup options=yourOptionsArray size="tiny|small|medium|etc" action="yourAction"}}}
```

When a button is clicked, `yourAction` will be called with the corresponding item of `yourOptions` array as the first argument.
The button will then show highlighted.


`yourOptionsArray` can be as simple as an array of Strings:

```
[
  "Option 1"
  "Option 2"
  "Option 3"
]
```

It can also be an array of objects. In that case please implement the `label` property for each item.

```
[
  {
    label: "Option 1",
    class: "option_1"
  },
  {
    label: "Option 2",
    class: "option_2"
  },
  {
    label: "Option 3",
    class: "option_3"
  }
]
```

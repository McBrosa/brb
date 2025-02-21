defmodule BrbWeb.ErrorHelpers do
  use Phoenix.HTML

  @doc """
  Translates an error message using gettext.
  """
  def translate_error({msg, opts}) do
    # If the error message is a binary, we simply return it.
    # Otherwise we use Gettext to translate it.
    if count = opts[:count] do
      Gettext.dngettext(BrbWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(BrbWeb.Gettext, "errors", msg, opts)
    end
  end
end

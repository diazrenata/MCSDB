#' @rdname use_default_data_path
#'
#' @description \code{check_default_data_path} checks if a default data path is
#'   set, and prompts the user to set it if it is missing.
#'
#' @inheritParams use_default_data_path
#' @return FALSE if there is no path set, TRUE otherwise
#'
#' @export
#'
check_default_data_path <- function(ENV_VAR = "MCSDB_DATA_PATH")
{
  if (is.na(get_default_data_path(fallback = NA, ENV_VAR)))
  {
    usethis::ui_warn("No default data path set!")
    usethis::ui_todo("Call {usethis::ui_code('use_default_data_path(\"<path>\")')} to set a default data path.")
    return(FALSE)
  }
  return(TRUE)
}

#' @rdname use_default_data_path
#'
#' @description \code{get_default_data_path} gets the value of the data path
#'   environmental variable
#'
#' @inheritParams use_default_data_path
#' @param fallback the default value to use if the setting is missing
#'
#' @export
#'
get_default_data_path <- function(fallback = "~", ENV_VAR = "MCSDB_DATA_PATH")
{
  Sys.getenv(ENV_VAR, unset = fallback)
}

#' @name use_default_data_path
#' @aliases get_default_data_path
#'
#' @title Manage the default path for downloading Portal Data into
#'
#' @description \code{use_default_data_path} has 3 steps. First, it checks for
#'   the presence of a pre-existing setting for the environmental variable.
#'   Then it checks if the folder exists and creates it, if needed. Then it
#'   provides instructions for setting the environmental variable.
#' @param path Folder into which data will be downloaded
#' @param ENV_VAR the environmental variable to check (by default
#'   `"MCSDB_DATA_PATH"``)
#'
#' @return None
#'
#' @export
use_default_data_path <- function(path = NULL, ENV_VAR = "MCSDB_DATA_PATH")
{
  # check for prexisting setting
  curr_data_path <- Sys.getenv(ENV_VAR, unset = NA)
  if (!is.na(curr_data_path))
  {
    warning("A default data path exists:", Sys.getenv(ENV_VAR), ".")
  }

  # check if a path is provided
  if (is.null(path))
  {
    usethis::ui_stop("Please provide a path to store downloaded data.")
  }

  # check if path is valid
  if (!dir.exists(path))
  {
    dir.create(path)
  }

  # copy new path setting to clipboard
  path_setting_string <- paste0(ENV_VAR, "=", '"', path, '"')

  usethis::ui_todo("Call {usethis::ui_code('usethis::edit_r_environ()')} to open {usethis::ui_path('.Renviron')}")
  usethis::ui_todo("Store your data path with a line like:")
  usethis::ui_code_block(path_setting_string)
  usethis::ui_todo("Make sure {usethis::ui_value('.Renviron')} ends with a newline!")
  return()
}

#' @title Download a dataset from data retriever
#' @aliases import_retriever_data
#'
#' @description \code{install_retriever_data} downloads retriever datasets and
#'   is a wrapper around rdataretriever::install
#'
#' @param path the overarching folder in which to download datasets
#' @param force_install whether to install the dataset if the correctly named
#'   folder already exists
#' @inheritParams rdataretriever::install
#'
#' @return NULL
#'
#' @examples
#' \dontrun{
#'   install_retriever_data("veg-plots-sdl")
#' }
#' @export
#'
install_retriever_data <- function(dataset, path = get_default_data_path(),
                                   force_install = FALSE)
{
    # check for existence of data_path
    path <- normalizePath(path, mustWork = TRUE)

    # where to put the retriever data
    folder_path <- file.path(path, dataset)
    if (dir.exists(folder_path) && !force_install)
    {
        message("A folder already exists for \"", dataset, "\".\n",
                "Use `force_install = TRUE` to overwrite it with a fresh install.")
    } else {
        # make the folder
        dir.create(folder_path)

        # install the retriever data
        rdataretriever::install(dataset, "csv",
                                data_dir = folder_path)
    }
}

#' @title Import a dataset downloaded from data retriever
#' @rdname install_retriever_data
#'
#' @description \code{import_retriever_data} loads a previously downloaded
#'   retriever dataset
#'
#' @inheritParams install_retriever_data
#'
#' @return NULL
#'
#' @examples
#' \dontrun{
#'   import_retriever_data("veg-plots-sdl")
#' }
#' @export
#'
import_retriever_data <- function(dataset, path = get_default_data_path())
{
    folder_path <- file.path(path, dataset)

    # check for existence of data_path
    files <- dir(folder_path)
    if (length(files) == 0) # check for presence of downloaded files
    {
        warning("Didn't find any downloaded data in ", folder_path, ".\n",
                "Did you run get_retriever_data() first?")
        return(NULL)
    }

    # load each csv and return a list
    tempdata <- vector('list', length(files))
    names(tempdata) <- sub('.csv', '', files)
    for (j in seq_along(files))
    {
        tempdata[[j]] <- utils::read.csv(file.path(folder_path, files[j]))
    }
    return(tempdata)
}

#' @title Load all retriever data
#'
#' @description Load all useable data from retriever
#'
#' @param names List of dataset names (from retriever) to load
#' @return A list of lists, all datasets compiled and retaining their retriever names
#' @examples
#' \dontrun{
#'   retriever_data(c("portal","veg-plots-sdl"))
#' }
#'
#' @noRd
#'
retriever_data <- function(names = c('breed-bird-survey',
                                     'mapped-plant-quads-mt',
                                     'fray-jorge-ecology',
                                     'veg-plots-sdl'))
{

    retriever <- sapply(names,rdataretriever::fetch, USE.NAMES = TRUE)

    return(retriever)

}

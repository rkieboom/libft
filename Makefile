NAME := libft.a

CC := gcc
CFLAGS := -Wall -Werror -Wextra

SRCDIR := src
OBJDIR := bin
HDRDIR := inc
PRINTF_DIR := printf

SRC_FILES := ft_memset.c ft_bzero.c ft_memcpy.c ft_memccpy.c ft_memmove.c\
ft_memchr.c ft_memcmp.c ft_strlen.c ft_strlcpy.c ft_strlcat.c ft_strchr.c\
ft_strrchr.c ft_strnstr.c ft_strncmp.c ft_atoi.c ft_isalpha.c ft_isdigit.c\
ft_isalnum.c ft_isascii.c ft_isprint.c ft_toupper.c ft_tolower.c ft_calloc.c\
ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c\
ft_strmapi.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c\
get_next_line.c

SRC_FILES := $(addprefix $(SRCDIR)/, $(SRC_FILES))
OBJ_FILES := $(addprefix $(OBJDIR)/, $(notdir $(SRC_FILES:.c=.o)))
HDR_FILES := $(HDRDIR)/libft.h

SUBMODULE_CHECK := $(PRINTF_DIR)/Makefile

all: $(NAME)

$(NAME): $(SUBMODULE_CHECK) $(OBJ_FILES)
	@$(MAKE) -C $(PRINTF_DIR) --no-print-directory
	ar rcs $(NAME) $(OBJ_FILES) $(addprefix $(PRINTF_DIR)/, $(shell $(MAKE) -C $(PRINTF_DIR) print-objects --no-print-directory 2>/dev/null))

$(SUBMODULE_CHECK):
	@if [ ! -f $(SUBMODULE_CHECK) ]; then \
		echo "Initializing submodules..."; \
		git submodule update --init --recursive; \
	fi

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(HDR_FILES) | $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@ -I$(HDRDIR)

$(OBJDIR):
	@mkdir -p $(OBJDIR)

init-submodules:
	git submodule update --init --recursive

update-submodules:
	git submodule update --remote --recursive

clean:
	@rm -rf $(OBJDIR)
	@if [ -f $(SUBMODULE_CHECK) ]; then \
		$(MAKE) -C $(PRINTF_DIR) clean --no-print-directory; \
	fi

fclean: clean
	@rm -rf $(NAME)
	@if [ -f $(SUBMODULE_CHECK) ]; then \
		$(MAKE) -C $(PRINTF_DIR) fclean --no-print-directory; \
	fi

re: fclean all

.PHONY: all clean fclean re init-submodules update-submodules
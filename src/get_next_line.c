#include "libft.h"

char *get_next_line(int fd)
{
	static char	*line;
	char	*buffer;
	int		read_bytes;
	char	*temp;

	if (fd < 0 || BUFFER_SIZE <= 0)
		return (NULL);
	if (line == NULL)
		line = ft_calloc(1, sizeof(char));
	buffer = ft_calloc(BUFFER_SIZE + 1, sizeof(char));
	if (buffer == NULL || line == NULL)
		return (free(line), NULL);
	read_bytes = read(fd, buffer, BUFFER_SIZE);
	while (read_bytes > 0)
	{
		if (read_bytes == -1)
			return (free(line), free(buffer), NULL);
		else if (read_bytes == 0)
			break ;
		buffer[read_bytes] = '\0';
		temp = ft_strjoin(line, buffer);
		free(line);
		line = temp;
		if (line == NULL)
			return (NULL);
		if (ft_strchr(buffer, '\n') != NULL)
			break ;
		read_bytes = read(fd, buffer, BUFFER_SIZE);

	}
	free(buffer);
	if (line[0] == '\0')
		return (free(line), NULL);
	return (line);
}
